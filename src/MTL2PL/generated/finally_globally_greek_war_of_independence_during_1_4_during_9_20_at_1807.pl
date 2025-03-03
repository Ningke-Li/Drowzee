:- include('database.pl').
greek_war_of_independence(Start,End) :- begin('greek_war_of_independence',_,_,Start), end('greek_war_of_independence',_,_,End), Start=<End.

globally_greek_war_of_independence_during_1_4(Start,End) :- greek_war_of_independence(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_greek_war_of_independence_during_1_4_during_9_20(Start,End) :- globally_greek_war_of_independence_during_1_4(Start1,End1), (Start1-20)=<(End1-9), Start is (Start1-20), End is (End1-9), Start=<End.

finally_globally_greek_war_of_independence_during_1_4_during_9_20_at_1807(Res) :- setof((Start,End),finally_globally_greek_war_of_independence_during_1_4_during_9_20(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = finally_globally_greek_war_of_independence_during_1_4_during_9_20_at_1807'), (finally_globally_greek_war_of_independence_during_1_4_during_9_20_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

