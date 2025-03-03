:- include('database.pl').
agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

compare_agents_of_s_h_i_e_l_d_(Dir,agents_of_s_h_i_e_l_d_(Start1,_),agents_of_s_h_i_e_l_d_(Start2,_)) :- Start1=<Start2.

generate_neg_agents_of_s_h_i_e_l_d_([]).

generate_neg_agents_of_s_h_i_e_l_d_([(Start,End) | Tail]) :- assert(neg_agents_of_s_h_i_e_l_d_(Start,End)), generate_neg_agents_of_s_h_i_e_l_d_(Tail).

sort_agents_of_s_h_i_e_l_d_(SortedIntervals) :- findall((Start,End),agents_of_s_h_i_e_l_d_(Start,End),UnsortedIntervals), predsort(compare_agents_of_s_h_i_e_l_d_,UnsortedIntervals,SortedIntervals).

generate_neg_agents_of_s_h_i_e_l_d__aux() :- sort_agents_of_s_h_i_e_l_d_(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_agents_of_s_h_i_e_l_d_(NegatedIntervals).

neg_agents_of_s_h_i_e_l_d__at_981(Res) :- setof((Start,End),neg_agents_of_s_h_i_e_l_d_(Start,End),AllINtervals), checkvalidity(981,AllINtervals,Res).

check_query() :- write('Query = neg_agents_of_s_h_i_e_l_d__at_981'), (neg_agents_of_s_h_i_e_l_d__at_981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_agents_of_s_h_i_e_l_d__aux().

