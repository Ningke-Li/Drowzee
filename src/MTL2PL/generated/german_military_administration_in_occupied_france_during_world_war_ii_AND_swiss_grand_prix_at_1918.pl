:- include('database.pl').
german_military_administration_in_occupied_france_during_world_war_ii(Start,End) :- begin('german_military_administration_in_occupied_france_during_world_war_ii',_,_,Start), end('german_military_administration_in_occupied_france_during_world_war_ii',_,_,End), Start=<End.

swiss_grand_prix(Start,End) :- begin('swiss_grand_prix',_,_,Start), end('swiss_grand_prix',_,_,End), Start=<End.

generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix([]) :- assert(german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix(-1,-1)).

generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix([(Start,End) | Tail]) :- assert(german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix(Start,End)), generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix(Tail).

german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix_aux() :- findall((Start,End),german_military_administration_in_occupied_france_during_world_war_ii(Start,End),Interval1), findall((Start,End),swiss_grand_prix(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix(Interval).

german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix_at_1918(Res) :- setof((Start,End),german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix_at_1918'), (german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).
?- german_military_administration_in_occupied_france_during_world_war_ii_AND_swiss_grand_prix_aux().

