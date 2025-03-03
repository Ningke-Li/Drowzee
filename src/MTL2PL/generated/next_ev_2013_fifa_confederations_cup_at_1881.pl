:- include('database.pl').
ev_2013_fifa_confederations_cup(Start,End) :- begin('ev_2013_fifa_confederations_cup',_,_,Start), end('ev_2013_fifa_confederations_cup',_,_,End), Start=<End.

next_ev_2013_fifa_confederations_cup(Start,End) :- ev_2013_fifa_confederations_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2013_fifa_confederations_cup_at_1881(Res) :- setof((Start,End),next_ev_2013_fifa_confederations_cup(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = next_ev_2013_fifa_confederations_cup_at_1881'), (next_ev_2013_fifa_confederations_cup_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

