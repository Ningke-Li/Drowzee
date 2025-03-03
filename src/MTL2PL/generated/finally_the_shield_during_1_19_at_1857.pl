:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

finally_the_shield_during_1_19(Start,End) :- the_shield(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_the_shield_during_1_19_at_1857(Res) :- setof((Start,End),finally_the_shield_during_1_19(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = finally_the_shield_during_1_19_at_1857'), (finally_the_shield_during_1_19_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).

