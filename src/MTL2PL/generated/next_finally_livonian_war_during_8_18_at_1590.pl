:- include('database.pl').
livonian_war(Start,End) :- begin('livonian_war',_,_,Start), end('livonian_war',_,_,End), Start=<End.

finally_livonian_war_during_8_18(Start,End) :- livonian_war(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

next_finally_livonian_war_during_8_18(Start,End) :- finally_livonian_war_during_8_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_livonian_war_during_8_18_at_1590(Res) :- setof((Start,End),next_finally_livonian_war_during_8_18(Start,End),AllINtervals), checkvalidity(1590,AllINtervals,Res).

check_query() :- write('Query = next_finally_livonian_war_during_8_18_at_1590'), (next_finally_livonian_war_during_8_18_at_1590(true) -> write('\nRes   = true');write('\nRes   = false')).

