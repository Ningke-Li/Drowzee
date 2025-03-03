:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

h_o__just_add_water(Start,End) :- begin('h_o__just_add_water',_,_,Start), end('h_o__just_add_water',_,_,End), Start=<End.

generate_facts_total_drama_island_AND_h_o__just_add_water([]) :- assert(total_drama_island_AND_h_o__just_add_water(-1,-1)).

generate_facts_total_drama_island_AND_h_o__just_add_water([(Start,End) | Tail]) :- assert(total_drama_island_AND_h_o__just_add_water(Start,End)), generate_facts_total_drama_island_AND_h_o__just_add_water(Tail).

total_drama_island_AND_h_o__just_add_water_aux() :- findall((Start,End),total_drama_island(Start,End),Interval1), findall((Start,End),h_o__just_add_water(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_total_drama_island_AND_h_o__just_add_water(Interval).

total_drama_island_AND_h_o__just_add_water_at_1989(Res) :- setof((Start,End),total_drama_island_AND_h_o__just_add_water(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = total_drama_island_AND_h_o__just_add_water_at_1989'), (total_drama_island_AND_h_o__just_add_water_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).
?- total_drama_island_AND_h_o__just_add_water_aux().

