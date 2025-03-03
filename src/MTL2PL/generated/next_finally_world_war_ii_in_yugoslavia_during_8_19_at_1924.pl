:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

finally_world_war_ii_in_yugoslavia_during_8_19(Start,End) :- world_war_ii_in_yugoslavia(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

next_finally_world_war_ii_in_yugoslavia_during_8_19(Start,End) :- finally_world_war_ii_in_yugoslavia_during_8_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_world_war_ii_in_yugoslavia_during_8_19_at_1924(Res) :- setof((Start,End),next_finally_world_war_ii_in_yugoslavia_during_8_19(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = next_finally_world_war_ii_in_yugoslavia_during_8_19_at_1924'), (next_finally_world_war_ii_in_yugoslavia_during_8_19_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

