:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

generate_facts_the_good_wife_AND_teenage_mutant_ninja_turtles([]) :- assert(the_good_wife_AND_teenage_mutant_ninja_turtles(-1,-1)).

generate_facts_the_good_wife_AND_teenage_mutant_ninja_turtles([(Start,End) | Tail]) :- assert(the_good_wife_AND_teenage_mutant_ninja_turtles(Start,End)), generate_facts_the_good_wife_AND_teenage_mutant_ninja_turtles(Tail).

the_good_wife_AND_teenage_mutant_ninja_turtles_aux() :- findall((Start,End),the_good_wife(Start,End),Interval1), findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_good_wife_AND_teenage_mutant_ninja_turtles(Interval).

the_good_wife_AND_teenage_mutant_ninja_turtles_at_2026(Res) :- setof((Start,End),the_good_wife_AND_teenage_mutant_ninja_turtles(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_AND_teenage_mutant_ninja_turtles_at_2026'), (the_good_wife_AND_teenage_mutant_ninja_turtles_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_wife_AND_teenage_mutant_ninja_turtles_aux().

