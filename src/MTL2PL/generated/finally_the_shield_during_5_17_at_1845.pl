:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

finally_the_shield_during_5_17(Start,End) :- the_shield(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_the_shield_during_5_17_at_1845(Res) :- setof((Start,End),finally_the_shield_during_5_17(Start,End),AllINtervals), checkvalidity(1845,AllINtervals,Res).

check_query() :- write('Query = finally_the_shield_during_5_17_at_1845'), (finally_the_shield_during_5_17_at_1845(true) -> write('\nRes   = true');write('\nRes   = false')).

