:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

generate_facts_supernatural_AND_star_vs__the_forces_of_evil([]) :- assert(supernatural_AND_star_vs__the_forces_of_evil(-1,-1)).

generate_facts_supernatural_AND_star_vs__the_forces_of_evil([(Start,End) | Tail]) :- assert(supernatural_AND_star_vs__the_forces_of_evil(Start,End)), generate_facts_supernatural_AND_star_vs__the_forces_of_evil(Tail).

supernatural_AND_star_vs__the_forces_of_evil_aux() :- findall((Start,End),supernatural(Start,End),Interval1), findall((Start,End),star_vs__the_forces_of_evil(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_supernatural_AND_star_vs__the_forces_of_evil(Interval).

supernatural_AND_star_vs__the_forces_of_evil_at_2018(Res) :- setof((Start,End),supernatural_AND_star_vs__the_forces_of_evil(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = supernatural_AND_star_vs__the_forces_of_evil_at_2018'), (supernatural_AND_star_vs__the_forces_of_evil_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- supernatural_AND_star_vs__the_forces_of_evil_aux().

