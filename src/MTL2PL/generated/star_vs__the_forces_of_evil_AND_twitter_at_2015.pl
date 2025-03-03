:- include('database.pl').
star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

generate_facts_star_vs__the_forces_of_evil_AND_twitter([]) :- assert(star_vs__the_forces_of_evil_AND_twitter(-1,-1)).

generate_facts_star_vs__the_forces_of_evil_AND_twitter([(Start,End) | Tail]) :- assert(star_vs__the_forces_of_evil_AND_twitter(Start,End)), generate_facts_star_vs__the_forces_of_evil_AND_twitter(Tail).

star_vs__the_forces_of_evil_AND_twitter_aux() :- findall((Start,End),star_vs__the_forces_of_evil(Start,End),Interval1), findall((Start,End),twitter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_star_vs__the_forces_of_evil_AND_twitter(Interval).

star_vs__the_forces_of_evil_AND_twitter_at_2015(Res) :- setof((Start,End),star_vs__the_forces_of_evil_AND_twitter(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = star_vs__the_forces_of_evil_AND_twitter_at_2015'), (star_vs__the_forces_of_evil_AND_twitter_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_vs__the_forces_of_evil_AND_twitter_aux().

