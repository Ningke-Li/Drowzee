:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

finally_world_war_ii_in_yugoslavia_during_3_19(Start,End) :- world_war_ii_in_yugoslavia(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

globally_finally_world_war_ii_in_yugoslavia_during_3_19_during_3_20(Start,End) :- finally_world_war_ii_in_yugoslavia_during_3_19(Start1,End1), Start is (Start1-3), End is (End1-20), Start=<End.

globally_finally_world_war_ii_in_yugoslavia_during_3_19_during_3_20_at_1920(Res) :- setof((Start,End),globally_finally_world_war_ii_in_yugoslavia_during_3_19_during_3_20(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = globally_finally_world_war_ii_in_yugoslavia_during_3_19_during_3_20_at_1920'), (globally_finally_world_war_ii_in_yugoslavia_during_3_19_during_3_20_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).

