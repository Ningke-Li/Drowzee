:- include('database.pl').
irish_civil_war(Start,End) :- begin('irish_civil_war',_,_,Start), end('irish_civil_war',_,_,End), Start=<End.

finally_irish_civil_war_during_4_13(Start,End) :- irish_civil_war(Start1,End1), (Start1-13)=<(End1-4), Start is (Start1-13), End is (End1-4), Start=<End.

finally_irish_civil_war_during_4_13_at_1798(Res) :- setof((Start,End),finally_irish_civil_war_during_4_13(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = finally_irish_civil_war_during_4_13_at_1798'), (finally_irish_civil_war_during_4_13_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).

