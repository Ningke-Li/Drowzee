:- include('database.pl').
german_military_administration_in_occupied_france_during_world_war_ii(Start,End) :- begin('german_military_administration_in_occupied_france_during_world_war_ii',_,_,Start), end('german_military_administration_in_occupied_france_during_world_war_ii',_,_,End), Start=<End.

finally_german_military_administration_in_occupied_france_during_world_war_ii_during_8_12(Start,End) :- german_military_administration_in_occupied_france_during_world_war_ii(Start1,End1), (Start1-12)=<(End1-8), Start is (Start1-12), End is (End1-8), Start=<End.

finally_german_military_administration_in_occupied_france_during_world_war_ii_during_8_12_at_1807(Res) :- setof((Start,End),finally_german_military_administration_in_occupied_france_during_world_war_ii_during_8_12(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = finally_german_military_administration_in_occupied_france_during_world_war_ii_during_8_12_at_1807'), (finally_german_military_administration_in_occupied_france_during_world_war_ii_during_8_12_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

