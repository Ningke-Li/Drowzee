:- include('database.pl').
agents_of_s_h_i_e_l_d_(Start,End) :- begin('agents_of_s_h_i_e_l_d_',_,_,Start), end('agents_of_s_h_i_e_l_d_',_,_,End), Start=<End.

the_crown(Start,End) :- begin('the_crown',_,_,Start), end('the_crown',_,_,End), Start=<End.

agents_of_s_h_i_e_l_d__last_till_2_3(Start,End) :- agents_of_s_h_i_e_l_d_(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

agents_of_s_h_i_e_l_d__until_the_crown_during_2_3_overlap(Start,End) :- agents_of_s_h_i_e_l_d__last_till_2_3(Start1,End1), the_crown(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

agents_of_s_h_i_e_l_d__until_the_crown_during_2_3(Start,End) :- agents_of_s_h_i_e_l_d_(W1,_), agents_of_s_h_i_e_l_d__until_the_crown_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

agents_of_s_h_i_e_l_d__until_the_crown_during_2_3_at_1961(Res) :- setof((Start,End),agents_of_s_h_i_e_l_d__until_the_crown_during_2_3(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = agents_of_s_h_i_e_l_d__until_the_crown_during_2_3_at_1961'), (agents_of_s_h_i_e_l_d__until_the_crown_during_2_3_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).

