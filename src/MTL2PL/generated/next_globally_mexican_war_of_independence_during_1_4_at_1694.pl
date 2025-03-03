:- include('database.pl').
mexican_war_of_independence(Start,End) :- begin('mexican_war_of_independence',_,_,Start), end('mexican_war_of_independence',_,_,End), Start=<End.

globally_mexican_war_of_independence_during_1_4(Start,End) :- mexican_war_of_independence(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

next_globally_mexican_war_of_independence_during_1_4(Start,End) :- globally_mexican_war_of_independence_during_1_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_mexican_war_of_independence_during_1_4_at_1694(Res) :- setof((Start,End),next_globally_mexican_war_of_independence_during_1_4(Start,End),AllINtervals), checkvalidity(1694,AllINtervals,Res).

check_query() :- write('Query = next_globally_mexican_war_of_independence_during_1_4_at_1694'), (next_globally_mexican_war_of_independence_during_1_4_at_1694(true) -> write('\nRes   = true');write('\nRes   = false')).

