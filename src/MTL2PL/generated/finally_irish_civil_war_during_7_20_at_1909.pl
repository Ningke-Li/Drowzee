:- include('database.pl').
irish_civil_war(Start,End) :- begin('irish_civil_war',_,_,Start), end('irish_civil_war',_,_,End), Start=<End.

finally_irish_civil_war_during_7_20(Start,End) :- irish_civil_war(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_irish_civil_war_during_7_20_at_1909(Res) :- setof((Start,End),finally_irish_civil_war_during_7_20(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = finally_irish_civil_war_during_7_20_at_1909'), (finally_irish_civil_war_during_7_20_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

