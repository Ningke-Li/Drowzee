:- include('database.pl').
ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

compare_ev_2018_fifa_world_cup_qualification__afc_(Dir,ev_2018_fifa_world_cup_qualification__afc_(Start1,_),ev_2018_fifa_world_cup_qualification__afc_(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2018_fifa_world_cup_qualification__afc_([]).

generate_neg_ev_2018_fifa_world_cup_qualification__afc_([(Start,End) | Tail]) :- assert(neg_ev_2018_fifa_world_cup_qualification__afc_(Start,End)), generate_neg_ev_2018_fifa_world_cup_qualification__afc_(Tail).

sort_ev_2018_fifa_world_cup_qualification__afc_(SortedIntervals) :- findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),UnsortedIntervals), predsort(compare_ev_2018_fifa_world_cup_qualification__afc_,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2018_fifa_world_cup_qualification__afc__aux() :- sort_ev_2018_fifa_world_cup_qualification__afc_(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2018_fifa_world_cup_qualification__afc_(NegatedIntervals).

neg_ev_2018_fifa_world_cup_qualification__afc__at_1085(Res) :- setof((Start,End),neg_ev_2018_fifa_world_cup_qualification__afc_(Start,End),AllINtervals), checkvalidity(1085,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2018_fifa_world_cup_qualification__afc__at_1085'), (neg_ev_2018_fifa_world_cup_qualification__afc__at_1085(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2018_fifa_world_cup_qualification__afc__aux().

