:- include('database.pl').
spanish_civil_war(Start,End) :- begin('spanish_civil_war',_,_,Start), end('spanish_civil_war',_,_,End), Start=<End.

finally_spanish_civil_war_during_1_19(Start,End) :- spanish_civil_war(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_spanish_civil_war_during_1_19_at_1893(Res) :- setof((Start,End),finally_spanish_civil_war_during_1_19(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = finally_spanish_civil_war_during_1_19_at_1893'), (finally_spanish_civil_war_during_1_19_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

