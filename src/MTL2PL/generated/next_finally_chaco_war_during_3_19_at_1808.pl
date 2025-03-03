:- include('database.pl').
chaco_war(Start,End) :- begin('chaco_war',_,_,Start), end('chaco_war',_,_,End), Start=<End.

finally_chaco_war_during_3_19(Start,End) :- chaco_war(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

next_finally_chaco_war_during_3_19(Start,End) :- finally_chaco_war_during_3_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_chaco_war_during_3_19_at_1808(Res) :- setof((Start,End),next_finally_chaco_war_during_3_19(Start,End),AllINtervals), checkvalidity(1808,AllINtervals,Res).

check_query() :- write('Query = next_finally_chaco_war_during_3_19_at_1808'), (next_finally_chaco_war_during_3_19_at_1808(true) -> write('\nRes   = true');write('\nRes   = false')).

