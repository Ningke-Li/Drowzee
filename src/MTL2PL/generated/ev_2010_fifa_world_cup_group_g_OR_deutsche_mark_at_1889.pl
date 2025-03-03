:- include('database.pl').
ev_2010_fifa_world_cup_group_g(Start,End) :- begin('ev_2010_fifa_world_cup_group_g',_,_,Start), end('ev_2010_fifa_world_cup_group_g',_,_,End), Start=<End.

deutsche_mark(Start,End) :- begin('deutsche_mark',_,_,Start), end('deutsche_mark',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_group_g_OR_deutsche_mark([]) :- assert(ev_2010_fifa_world_cup_group_g_OR_deutsche_mark(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_group_g_OR_deutsche_mark([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_group_g_OR_deutsche_mark(Start,End)), generate_facts_ev_2010_fifa_world_cup_group_g_OR_deutsche_mark(Tail).

ev_2010_fifa_world_cup_group_g_OR_deutsche_mark_aux() :- findall((Start,End),ev_2010_fifa_world_cup_group_g(Start,End),Interval1), findall((Start,End),deutsche_mark(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_group_g_OR_deutsche_mark(Interval).

ev_2010_fifa_world_cup_group_g_OR_deutsche_mark_at_1889(Res) :- setof((Start,End),ev_2010_fifa_world_cup_group_g_OR_deutsche_mark(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_group_g_OR_deutsche_mark_at_1889'), (ev_2010_fifa_world_cup_group_g_OR_deutsche_mark_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_group_g_OR_deutsche_mark_aux().

