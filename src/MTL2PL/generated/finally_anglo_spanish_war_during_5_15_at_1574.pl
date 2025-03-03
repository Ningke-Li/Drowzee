:- include('database.pl').
anglo_spanish_war(Start,End) :- begin('anglo_spanish_war',_,_,Start), end('anglo_spanish_war',_,_,End), Start=<End.

finally_anglo_spanish_war_during_5_15(Start,End) :- anglo_spanish_war(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_anglo_spanish_war_during_5_15_at_1574(Res) :- setof((Start,End),finally_anglo_spanish_war_during_5_15(Start,End),AllINtervals), checkvalidity(1574,AllINtervals,Res).

check_query() :- write('Query = finally_anglo_spanish_war_during_5_15_at_1574'), (finally_anglo_spanish_war_during_5_15_at_1574(true) -> write('\nRes   = true');write('\nRes   = false')).

