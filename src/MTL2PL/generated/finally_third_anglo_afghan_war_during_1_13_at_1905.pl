:- include('database.pl').
third_anglo_afghan_war(Start,End) :- begin('third_anglo_afghan_war',_,_,Start), end('third_anglo_afghan_war',_,_,End), Start=<End.

finally_third_anglo_afghan_war_during_1_13(Start,End) :- third_anglo_afghan_war(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_third_anglo_afghan_war_during_1_13_at_1905(Res) :- setof((Start,End),finally_third_anglo_afghan_war_during_1_13(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = finally_third_anglo_afghan_war_during_1_13_at_1905'), (finally_third_anglo_afghan_war_during_1_13_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

