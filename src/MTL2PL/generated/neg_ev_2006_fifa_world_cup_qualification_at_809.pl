:- include('database.pl').
ev_2006_fifa_world_cup_qualification(Start,End) :- begin('ev_2006_fifa_world_cup_qualification',_,_,Start), end('ev_2006_fifa_world_cup_qualification',_,_,End), Start=<End.

compare_ev_2006_fifa_world_cup_qualification(Dir,ev_2006_fifa_world_cup_qualification(Start1,_),ev_2006_fifa_world_cup_qualification(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_fifa_world_cup_qualification([]).

generate_neg_ev_2006_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(neg_ev_2006_fifa_world_cup_qualification(Start,End)), generate_neg_ev_2006_fifa_world_cup_qualification(Tail).

sort_ev_2006_fifa_world_cup_qualification(SortedIntervals) :- findall((Start,End),ev_2006_fifa_world_cup_qualification(Start,End),UnsortedIntervals), predsort(compare_ev_2006_fifa_world_cup_qualification,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_fifa_world_cup_qualification_aux() :- sort_ev_2006_fifa_world_cup_qualification(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_fifa_world_cup_qualification(NegatedIntervals).

neg_ev_2006_fifa_world_cup_qualification_at_809(Res) :- setof((Start,End),neg_ev_2006_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(809,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_fifa_world_cup_qualification_at_809'), (neg_ev_2006_fifa_world_cup_qualification_at_809(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_fifa_world_cup_qualification_aux().

