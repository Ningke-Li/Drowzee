:- include('database.pl').
ev_2010_fifa_world_cup_group_f(Start,End) :- begin('ev_2010_fifa_world_cup_group_f',_,_,Start), end('ev_2010_fifa_world_cup_group_f',_,_,End), Start=<End.

mau_mau_uprising(Start,End) :- begin('mau_mau_uprising',_,_,Start), end('mau_mau_uprising',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising([]) :- assert(ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising(Start,End)), generate_facts_ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising(Tail).

ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising_aux() :- findall((Start,End),ev_2010_fifa_world_cup_group_f(Start,End),Interval1), findall((Start,End),mau_mau_uprising(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising(Interval).

ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising_at_1828(Res) :- setof((Start,End),ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising_at_1828'), (ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_group_f_OR_mau_mau_uprising_aux().

