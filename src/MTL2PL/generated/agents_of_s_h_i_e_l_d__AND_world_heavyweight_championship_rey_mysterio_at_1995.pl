:- include('database.pl').
agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

generate_facts_agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio([]) :- assert(agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio(-1,-1)).

generate_facts_agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio([(Start,End) | Tail]) :- assert(agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio(Start,End)), generate_facts_agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio(Tail).

agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio_aux() :- findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval1), findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio(Interval).

agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio_at_1995(Res) :- setof((Start,End),agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio_at_1995'), (agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).
?- agents_of_s_h_i_e_l_d__AND_world_heavyweight_championship_rey_mysterio_aux().

