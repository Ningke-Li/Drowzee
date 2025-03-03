:- include('database.pl').
ev_2009_fifa_confederations_cup(Start,End) :- begin('ev_2009_fifa_confederations_cup',_,_,Start), end('ev_2009_fifa_confederations_cup',_,_,End), Start=<End.

finally_ev_2009_fifa_confederations_cup_during_7_14(Start,End) :- ev_2009_fifa_confederations_cup(Start1,End1), (Start1-14)=<(End1-7), Start is (Start1-14), End is (End1-7), Start=<End.

finally_ev_2009_fifa_confederations_cup_during_7_14_at_1987(Res) :- setof((Start,End),finally_ev_2009_fifa_confederations_cup_during_7_14(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_fifa_confederations_cup_during_7_14_at_1987'), (finally_ev_2009_fifa_confederations_cup_during_7_14_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

