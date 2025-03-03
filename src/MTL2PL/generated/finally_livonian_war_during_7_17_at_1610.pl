:- include('database.pl').
livonian_war(Start,End) :- begin('livonian_war',_,_,Start), end('livonian_war',_,_,End), Start=<End.

finally_livonian_war_during_7_17(Start,End) :- livonian_war(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

finally_livonian_war_during_7_17_at_1610(Res) :- setof((Start,End),finally_livonian_war_during_7_17(Start,End),AllINtervals), checkvalidity(1610,AllINtervals,Res).

check_query() :- write('Query = finally_livonian_war_during_7_17_at_1610'), (finally_livonian_war_during_7_17_at_1610(true) -> write('\nRes   = true');write('\nRes   = false')).

