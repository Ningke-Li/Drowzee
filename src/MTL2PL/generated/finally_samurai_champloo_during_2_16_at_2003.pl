:- include('database.pl').
samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

finally_samurai_champloo_during_2_16(Start,End) :- samurai_champloo(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_samurai_champloo_during_2_16_at_2003(Res) :- setof((Start,End),finally_samurai_champloo_during_2_16(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_samurai_champloo_during_2_16_at_2003'), (finally_samurai_champloo_during_2_16_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

