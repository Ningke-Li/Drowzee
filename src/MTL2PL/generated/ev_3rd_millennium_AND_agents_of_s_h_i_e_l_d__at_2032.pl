:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

generate_facts_ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_([]) :- assert(ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_(-1,-1)).

generate_facts_ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_([(Start,End) | Tail]) :- assert(ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_(Start,End)), generate_facts_ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_(Tail).

ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d__aux() :- findall((Start,End),ev_3rd_millennium(Start,End),Interval1), findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_(Interval).

ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d__at_2032(Res) :- setof((Start,End),ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d_(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d__at_2032'), (ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d__at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_3rd_millennium_AND_agents_of_s_h_i_e_l_d__aux().

