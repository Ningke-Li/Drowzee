:- include('database.pl').
agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

generate_facts_agents_of_s_h_i_e_l_d__AND_the_thundermans([]) :- assert(agents_of_s_h_i_e_l_d__AND_the_thundermans(-1,-1)).

generate_facts_agents_of_s_h_i_e_l_d__AND_the_thundermans([(Start,End) | Tail]) :- assert(agents_of_s_h_i_e_l_d__AND_the_thundermans(Start,End)), generate_facts_agents_of_s_h_i_e_l_d__AND_the_thundermans(Tail).

agents_of_s_h_i_e_l_d__AND_the_thundermans_aux() :- findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval1), findall((Start,End),the_thundermans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_agents_of_s_h_i_e_l_d__AND_the_thundermans(Interval).

agents_of_s_h_i_e_l_d__AND_the_thundermans_at_2039(Res) :- setof((Start,End),agents_of_s_h_i_e_l_d__AND_the_thundermans(Start,End),AllINtervals), checkvalidity(2039,AllINtervals,Res).

check_query() :- write('Query = agents_of_s_h_i_e_l_d__AND_the_thundermans_at_2039'), (agents_of_s_h_i_e_l_d__AND_the_thundermans_at_2039(true) -> write('\nRes   = true');write('\nRes   = false')).
?- agents_of_s_h_i_e_l_d__AND_the_thundermans_aux().

