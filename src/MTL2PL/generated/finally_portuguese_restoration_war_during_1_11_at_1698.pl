:- include('database.pl').
portuguese_restoration_war(Start,End) :- begin('portuguese_restoration_war',_,_,Start), end('portuguese_restoration_war',_,_,End), Start=<End.

finally_portuguese_restoration_war_during_1_11(Start,End) :- portuguese_restoration_war(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_portuguese_restoration_war_during_1_11_at_1698(Res) :- setof((Start,End),finally_portuguese_restoration_war_during_1_11(Start,End),AllINtervals), checkvalidity(1698,AllINtervals,Res).

check_query() :- write('Query = finally_portuguese_restoration_war_during_1_11_at_1698'), (finally_portuguese_restoration_war_during_1_11_at_1698(true) -> write('\nRes   = true');write('\nRes   = false')).

