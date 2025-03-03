:- include('database.pl').
ev_2009_fifa_confederations_cup(Start,End) :- begin('ev_2009_fifa_confederations_cup',_,_,Start), end('ev_2009_fifa_confederations_cup',_,_,End), Start=<End.

finally_ev_2009_fifa_confederations_cup_during_9_13(Start,End) :- ev_2009_fifa_confederations_cup(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_ev_2009_fifa_confederations_cup_during_9_13_at_1996(Res) :- setof((Start,End),finally_ev_2009_fifa_confederations_cup_during_9_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_fifa_confederations_cup_during_9_13_at_1996'), (finally_ev_2009_fifa_confederations_cup_during_9_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

