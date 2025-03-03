:- include('database.pl').
mexican_war_of_independence(Start,End) :- begin('mexican_war_of_independence',_,_,Start), end('mexican_war_of_independence',_,_,End), Start=<End.

globally_mexican_war_of_independence_during_13_21(Start,End) :- mexican_war_of_independence(Start1,End1), Start is (Start1-13), End is (End1-21), Start=<End.

next_globally_mexican_war_of_independence_during_13_21(Start,End) :- globally_mexican_war_of_independence_during_13_21(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_mexican_war_of_independence_during_13_21_at_1798(Res) :- setof((Start,End),next_globally_mexican_war_of_independence_during_13_21(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = next_globally_mexican_war_of_independence_during_13_21_at_1798'), (next_globally_mexican_war_of_independence_during_13_21_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).

