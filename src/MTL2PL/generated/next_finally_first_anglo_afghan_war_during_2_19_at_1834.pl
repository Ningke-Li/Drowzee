:- include('database.pl').
first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

finally_first_anglo_afghan_war_during_2_19(Start,End) :- first_anglo_afghan_war(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

next_finally_first_anglo_afghan_war_during_2_19(Start,End) :- finally_first_anglo_afghan_war_during_2_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_first_anglo_afghan_war_during_2_19_at_1834(Res) :- setof((Start,End),next_finally_first_anglo_afghan_war_during_2_19(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = next_finally_first_anglo_afghan_war_during_2_19_at_1834'), (next_finally_first_anglo_afghan_war_during_2_19_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).

