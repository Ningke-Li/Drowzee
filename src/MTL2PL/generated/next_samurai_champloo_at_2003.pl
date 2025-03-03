:- include('database.pl').
samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

next_samurai_champloo(Start,End) :- samurai_champloo(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_samurai_champloo_at_2003(Res) :- setof((Start,End),next_samurai_champloo(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = next_samurai_champloo_at_2003'), (next_samurai_champloo_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

