:- include('database.pl').
r_k_czi_s_war_of_independence(Start,End) :- begin('r_k_czi_s_war_of_independence',_,_,Start), end('r_k_czi_s_war_of_independence',_,_,End), Start=<End.

three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

generate_facts_r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war([]) :- assert(r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war(-1,-1)).

generate_facts_r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war([(Start,End) | Tail]) :- assert(r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war(Start,End)), generate_facts_r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war(Tail).

r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war_aux() :- findall((Start,End),r_k_czi_s_war_of_independence(Start,End),Interval1), findall((Start,End),three_hundred_and_thirty_five_years__war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war(Interval).

r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war_at_1731(Res) :- setof((Start,End),r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war(Start,End),AllINtervals), checkvalidity(1731,AllINtervals,Res).

check_query() :- write('Query = r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war_at_1731'), (r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war_at_1731(true) -> write('\nRes   = true');write('\nRes   = false')).
?- r_k_czi_s_war_of_independence_AND_three_hundred_and_thirty_five_years__war_aux().

