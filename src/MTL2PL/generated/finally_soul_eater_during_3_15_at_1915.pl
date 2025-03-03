:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

finally_soul_eater_during_3_15(Start,End) :- soul_eater(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_soul_eater_during_3_15_at_1915(Res) :- setof((Start,End),finally_soul_eater_during_3_15(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = finally_soul_eater_during_3_15_at_1915'), (finally_soul_eater_during_3_15_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

