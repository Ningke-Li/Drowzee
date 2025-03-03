:- include('database.pl').
iraqi_civil_war_of_2014_2017(Start,End) :- begin('iraqi_civil_war_of_2014_2017',_,_,Start), end('iraqi_civil_war_of_2014_2017',_,_,End), Start=<End.

agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

generate_facts_iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_([]) :- assert(iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_(-1,-1)).

generate_facts_iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_([(Start,End) | Tail]) :- assert(iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_(Start,End)), generate_facts_iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_(Tail).

iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d__aux() :- findall((Start,End),iraqi_civil_war_of_2014_2017(Start,End),Interval1), findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_(Interval).

iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d__at_2015(Res) :- setof((Start,End),iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d_(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d__at_2015'), (iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d__at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iraqi_civil_war_of_2014_2017_AND_agents_of_s_h_i_e_l_d__aux().

