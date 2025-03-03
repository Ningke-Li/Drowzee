:- include('database.pl').
cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

globally_cuban_war_of_independence_during_1_2(Start,End) :- cuban_war_of_independence(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

finally_globally_cuban_war_of_independence_during_1_2_during_3_14(Start,End) :- globally_cuban_war_of_independence_during_1_2(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_globally_cuban_war_of_independence_during_1_2_during_3_14_at_1782(Res) :- setof((Start,End),finally_globally_cuban_war_of_independence_during_1_2_during_3_14(Start,End),AllINtervals), checkvalidity(1782,AllINtervals,Res).

check_query() :- write('Query = finally_globally_cuban_war_of_independence_during_1_2_during_3_14_at_1782'), (finally_globally_cuban_war_of_independence_during_1_2_during_3_14_at_1782(true) -> write('\nRes   = true');write('\nRes   = false')).

