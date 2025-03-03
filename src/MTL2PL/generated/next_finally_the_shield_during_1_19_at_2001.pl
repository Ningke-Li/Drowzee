:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

finally_the_shield_during_1_19(Start,End) :- the_shield(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

next_finally_the_shield_during_1_19(Start,End) :- finally_the_shield_during_1_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_shield_during_1_19_at_2001(Res) :- setof((Start,End),next_finally_the_shield_during_1_19(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_shield_during_1_19_at_2001'), (next_finally_the_shield_during_1_19_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

