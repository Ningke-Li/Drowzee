:- include('database.pl').
samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

finally_samurai_champloo_during_8_18(Start,End) :- samurai_champloo(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_samurai_champloo_during_8_18_at_1992(Res) :- setof((Start,End),finally_samurai_champloo_during_8_18(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_samurai_champloo_during_8_18_at_1992'), (finally_samurai_champloo_during_8_18_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

