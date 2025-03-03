:- include('database.pl').
r_k_czi_s_war_of_independence(Start,End) :- begin('r_k_czi_s_war_of_independence',_,_,Start), end('r_k_czi_s_war_of_independence',_,_,End), Start=<End.

globally_r_k_czi_s_war_of_independence_during_6_8(Start,End) :- r_k_czi_s_war_of_independence(Start1,End1), Start is (Start1-6), End is (End1-8), Start=<End.

globally_r_k_czi_s_war_of_independence_during_6_8_at_1703(Res) :- setof((Start,End),globally_r_k_czi_s_war_of_independence_during_6_8(Start,End),AllINtervals), checkvalidity(1703,AllINtervals,Res).

check_query() :- write('Query = globally_r_k_czi_s_war_of_independence_during_6_8_at_1703'), (globally_r_k_czi_s_war_of_independence_during_6_8_at_1703(true) -> write('\nRes   = true');write('\nRes   = false')).

