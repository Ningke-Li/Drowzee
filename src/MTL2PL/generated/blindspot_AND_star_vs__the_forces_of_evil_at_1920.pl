:- include('database.pl').
blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

generate_facts_blindspot_AND_star_vs__the_forces_of_evil([]) :- assert(blindspot_AND_star_vs__the_forces_of_evil(-1,-1)).

generate_facts_blindspot_AND_star_vs__the_forces_of_evil([(Start,End) | Tail]) :- assert(blindspot_AND_star_vs__the_forces_of_evil(Start,End)), generate_facts_blindspot_AND_star_vs__the_forces_of_evil(Tail).

blindspot_AND_star_vs__the_forces_of_evil_aux() :- findall((Start,End),blindspot(Start,End),Interval1), findall((Start,End),star_vs__the_forces_of_evil(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_blindspot_AND_star_vs__the_forces_of_evil(Interval).

blindspot_AND_star_vs__the_forces_of_evil_at_1920(Res) :- setof((Start,End),blindspot_AND_star_vs__the_forces_of_evil(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = blindspot_AND_star_vs__the_forces_of_evil_at_1920'), (blindspot_AND_star_vs__the_forces_of_evil_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).
?- blindspot_AND_star_vs__the_forces_of_evil_aux().

