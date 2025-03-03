:- include('database.pl').
ev_2010_fifa_world_cup_group_f(Start,End) :- begin('ev_2010_fifa_world_cup_group_f',_,_,Start), end('ev_2010_fifa_world_cup_group_f',_,_,End), Start=<End.

greco_italian_war(Start,End) :- begin('greco_italian_war',_,_,Start), end('greco_italian_war',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_group_f_OR_greco_italian_war([]) :- assert(ev_2010_fifa_world_cup_group_f_OR_greco_italian_war(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_group_f_OR_greco_italian_war([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_group_f_OR_greco_italian_war(Start,End)), generate_facts_ev_2010_fifa_world_cup_group_f_OR_greco_italian_war(Tail).

ev_2010_fifa_world_cup_group_f_OR_greco_italian_war_aux() :- findall((Start,End),ev_2010_fifa_world_cup_group_f(Start,End),Interval1), findall((Start,End),greco_italian_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_group_f_OR_greco_italian_war(Interval).

ev_2010_fifa_world_cup_group_f_OR_greco_italian_war_at_1869(Res) :- setof((Start,End),ev_2010_fifa_world_cup_group_f_OR_greco_italian_war(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_group_f_OR_greco_italian_war_at_1869'), (ev_2010_fifa_world_cup_group_f_OR_greco_italian_war_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_group_f_OR_greco_italian_war_aux().

