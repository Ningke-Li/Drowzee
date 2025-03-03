:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

generate_facts_the_thundermans_AND_agents_of_s_h_i_e_l_d_([]) :- assert(the_thundermans_AND_agents_of_s_h_i_e_l_d_(-1,-1)).

generate_facts_the_thundermans_AND_agents_of_s_h_i_e_l_d_([(Start,End) | Tail]) :- assert(the_thundermans_AND_agents_of_s_h_i_e_l_d_(Start,End)), generate_facts_the_thundermans_AND_agents_of_s_h_i_e_l_d_(Tail).

the_thundermans_AND_agents_of_s_h_i_e_l_d__aux() :- findall((Start,End),the_thundermans(Start,End),Interval1), findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_thundermans_AND_agents_of_s_h_i_e_l_d_(Interval).

the_thundermans_AND_agents_of_s_h_i_e_l_d__at_2013(Res) :- setof((Start,End),the_thundermans_AND_agents_of_s_h_i_e_l_d_(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = the_thundermans_AND_agents_of_s_h_i_e_l_d__at_2013'), (the_thundermans_AND_agents_of_s_h_i_e_l_d__at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_thundermans_AND_agents_of_s_h_i_e_l_d__aux().

