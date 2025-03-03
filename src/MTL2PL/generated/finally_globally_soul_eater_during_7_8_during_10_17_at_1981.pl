:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

globally_soul_eater_during_7_8(Start,End) :- soul_eater(Start1,End1), Start is (Start1-7), End is (End1-8), Start=<End.

finally_globally_soul_eater_during_7_8_during_10_17(Start,End) :- globally_soul_eater_during_7_8(Start1,End1), (Start1-17)=<(End1-10), Start is (Start1-17), End is (End1-10), Start=<End.

finally_globally_soul_eater_during_7_8_during_10_17_at_1981(Res) :- setof((Start,End),finally_globally_soul_eater_during_7_8_during_10_17(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = finally_globally_soul_eater_during_7_8_during_10_17_at_1981'), (finally_globally_soul_eater_during_7_8_during_10_17_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).

