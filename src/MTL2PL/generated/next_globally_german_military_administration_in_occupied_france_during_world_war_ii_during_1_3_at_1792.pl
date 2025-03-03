:- include('database.pl').
german_military_administration_in_occupied_france_during_world_war_ii(Start,End) :- begin('german_military_administration_in_occupied_france_during_world_war_ii',_,_,Start), end('german_military_administration_in_occupied_france_during_world_war_ii',_,_,End), Start=<End.

globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3(Start,End) :- german_military_administration_in_occupied_france_during_world_war_ii(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3(Start,End) :- globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3_at_1792(Res) :- setof((Start,End),next_globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3(Start,End),AllINtervals), checkvalidity(1792,AllINtervals,Res).

check_query() :- write('Query = next_globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3_at_1792'), (next_globally_german_military_administration_in_occupied_france_during_world_war_ii_during_1_3_at_1792(true) -> write('\nRes   = true');write('\nRes   = false')).

