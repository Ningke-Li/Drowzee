:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

next_teen_titans(Start,End) :- teen_titans(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_teen_titans_at_1925(Res) :- setof((Start,End),next_teen_titans(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = next_teen_titans_at_1925'), (next_teen_titans_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

