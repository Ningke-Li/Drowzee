:- include('database.pl').
copa_am_rica_centenario(Start,End) :- begin('copa_am_rica_centenario',_,_,Start), end('copa_am_rica_centenario',_,_,End), Start=<End.

ev_2010_fifa_world_cup_group_h(Start,End) :- begin('ev_2010_fifa_world_cup_group_h',_,_,Start), end('ev_2010_fifa_world_cup_group_h',_,_,End), Start=<End.

generate_facts_copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h([]) :- assert(copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h(-1,-1)).

generate_facts_copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h([(Start,End) | Tail]) :- assert(copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h(Start,End)), generate_facts_copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h(Tail).

copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h_aux() :- findall((Start,End),copa_am_rica_centenario(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_group_h(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h(Interval).

copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h_at_1947(Res) :- setof((Start,End),copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h_at_1947'), (copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- copa_am_rica_centenario_OR_ev_2010_fifa_world_cup_group_h_aux().

