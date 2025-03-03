:- include('database.pl').
ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

generate_facts_ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_([]) :- assert(ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_(-1,-1)).

generate_facts_ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_([(Start,End) | Tail]) :- assert(ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_(Start,End)), generate_facts_ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_(Tail).

ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d__aux() :- findall((Start,End),ev_2013_14_uefa_champions_league(Start,End),Interval1), findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_(Interval).

ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d__at_1898(Res) :- setof((Start,End),ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d_(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d__at_1898'), (ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d__at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_uefa_champions_league_AND_agents_of_s_h_i_e_l_d__aux().

