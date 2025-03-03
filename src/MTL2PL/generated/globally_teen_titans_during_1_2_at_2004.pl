:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

globally_teen_titans_during_1_2(Start,End) :- teen_titans(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_teen_titans_during_1_2_at_2004(Res) :- setof((Start,End),globally_teen_titans_during_1_2(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = globally_teen_titans_during_1_2_at_2004'), (globally_teen_titans_during_1_2_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

