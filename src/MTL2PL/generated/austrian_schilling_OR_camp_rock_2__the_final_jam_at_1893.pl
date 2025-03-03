:- include('database.pl').
austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

camp_rock_2__the_final_jam(Start,End) :- begin('camp_rock_2__the_final_jam',_,_,Start), end('camp_rock_2__the_final_jam',_,_,End), Start=<End.

generate_facts_austrian_schilling_OR_camp_rock_2__the_final_jam([]) :- assert(austrian_schilling_OR_camp_rock_2__the_final_jam(-1,-1)).

generate_facts_austrian_schilling_OR_camp_rock_2__the_final_jam([(Start,End) | Tail]) :- assert(austrian_schilling_OR_camp_rock_2__the_final_jam(Start,End)), generate_facts_austrian_schilling_OR_camp_rock_2__the_final_jam(Tail).

austrian_schilling_OR_camp_rock_2__the_final_jam_aux() :- findall((Start,End),austrian_schilling(Start,End),Interval1), findall((Start,End),camp_rock_2__the_final_jam(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_austrian_schilling_OR_camp_rock_2__the_final_jam(Interval).

austrian_schilling_OR_camp_rock_2__the_final_jam_at_1893(Res) :- setof((Start,End),austrian_schilling_OR_camp_rock_2__the_final_jam(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = austrian_schilling_OR_camp_rock_2__the_final_jam_at_1893'), (austrian_schilling_OR_camp_rock_2__the_final_jam_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austrian_schilling_OR_camp_rock_2__the_final_jam_aux().

