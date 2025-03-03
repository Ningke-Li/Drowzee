:- include('database.pl').
first_battle_of_ypres(Start,End) :- begin('first_battle_of_ypres',_,_,Start), end('first_battle_of_ypres',_,_,End), Start=<End.

camp_rock_2__the_final_jam(Start,End) :- begin('camp_rock_2__the_final_jam',_,_,Start), end('camp_rock_2__the_final_jam',_,_,End), Start=<End.

generate_facts_first_battle_of_ypres_OR_camp_rock_2__the_final_jam([]) :- assert(first_battle_of_ypres_OR_camp_rock_2__the_final_jam(-1,-1)).

generate_facts_first_battle_of_ypres_OR_camp_rock_2__the_final_jam([(Start,End) | Tail]) :- assert(first_battle_of_ypres_OR_camp_rock_2__the_final_jam(Start,End)), generate_facts_first_battle_of_ypres_OR_camp_rock_2__the_final_jam(Tail).

first_battle_of_ypres_OR_camp_rock_2__the_final_jam_aux() :- findall((Start,End),first_battle_of_ypres(Start,End),Interval1), findall((Start,End),camp_rock_2__the_final_jam(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_battle_of_ypres_OR_camp_rock_2__the_final_jam(Interval).

first_battle_of_ypres_OR_camp_rock_2__the_final_jam_at_2054(Res) :- setof((Start,End),first_battle_of_ypres_OR_camp_rock_2__the_final_jam(Start,End),AllINtervals), checkvalidity(2054,AllINtervals,Res).

check_query() :- write('Query = first_battle_of_ypres_OR_camp_rock_2__the_final_jam_at_2054'), (first_battle_of_ypres_OR_camp_rock_2__the_final_jam_at_2054(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_battle_of_ypres_OR_camp_rock_2__the_final_jam_aux().

