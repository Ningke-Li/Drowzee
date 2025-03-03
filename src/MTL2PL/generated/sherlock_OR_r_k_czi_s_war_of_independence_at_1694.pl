:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

r_k_czi_s_war_of_independence(Start,End) :- begin('r_k_czi_s_war_of_independence',_,_,Start), end('r_k_czi_s_war_of_independence',_,_,End), Start=<End.

generate_facts_sherlock_OR_r_k_czi_s_war_of_independence([]) :- assert(sherlock_OR_r_k_czi_s_war_of_independence(-1,-1)).

generate_facts_sherlock_OR_r_k_czi_s_war_of_independence([(Start,End) | Tail]) :- assert(sherlock_OR_r_k_czi_s_war_of_independence(Start,End)), generate_facts_sherlock_OR_r_k_czi_s_war_of_independence(Tail).

sherlock_OR_r_k_czi_s_war_of_independence_aux() :- findall((Start,End),sherlock(Start,End),Interval1), findall((Start,End),r_k_czi_s_war_of_independence(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sherlock_OR_r_k_czi_s_war_of_independence(Interval).

sherlock_OR_r_k_czi_s_war_of_independence_at_1694(Res) :- setof((Start,End),sherlock_OR_r_k_czi_s_war_of_independence(Start,End),AllINtervals), checkvalidity(1694,AllINtervals,Res).

check_query() :- write('Query = sherlock_OR_r_k_czi_s_war_of_independence_at_1694'), (sherlock_OR_r_k_czi_s_war_of_independence_at_1694(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sherlock_OR_r_k_czi_s_war_of_independence_aux().

