:- include('database.pl').
german_military_administration_in_occupied_france_during_world_war_ii(Start,End) :- begin('german_military_administration_in_occupied_france_during_world_war_ii',_,_,Start), end('german_military_administration_in_occupied_france_during_world_war_ii',_,_,End), Start=<End.

finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12(Start,End) :- german_military_administration_in_occupied_france_during_world_war_ii(Start1,End1), (Start1-12)=<(End1-2), Start is (Start1-12), End is (End1-2), Start=<End.

next_finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12(Start,End) :- finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12_at_1976(Res) :- setof((Start,End),next_finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = next_finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12_at_1976'), (next_finally_german_military_administration_in_occupied_france_during_world_war_ii_during_2_12_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

