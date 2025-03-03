:- include('database.pl').
livonian_war(Start,End) :- begin('livonian_war',_,_,Start), end('livonian_war',_,_,End), Start=<End.

finally_livonian_war_during_8_20(Start,End) :- livonian_war(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

globally_finally_livonian_war_during_8_20_during_29_31(Start,End) :- finally_livonian_war_during_8_20(Start1,End1), Start is (Start1-29), End is (End1-31), Start=<End.

globally_finally_livonian_war_during_8_20_during_29_31_at_1582(Res) :- setof((Start,End),globally_finally_livonian_war_during_8_20_during_29_31(Start,End),AllINtervals), checkvalidity(1582,AllINtervals,Res).

check_query() :- write('Query = globally_finally_livonian_war_during_8_20_during_29_31_at_1582'), (globally_finally_livonian_war_during_8_20_during_29_31_at_1582(true) -> write('\nRes   = true');write('\nRes   = false')).

