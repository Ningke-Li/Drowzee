:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

generate_facts_estonian_kroon_AND_teenage_mutant_ninja_turtles([]) :- assert(estonian_kroon_AND_teenage_mutant_ninja_turtles(-1,-1)).

generate_facts_estonian_kroon_AND_teenage_mutant_ninja_turtles([(Start,End) | Tail]) :- assert(estonian_kroon_AND_teenage_mutant_ninja_turtles(Start,End)), generate_facts_estonian_kroon_AND_teenage_mutant_ninja_turtles(Tail).

estonian_kroon_AND_teenage_mutant_ninja_turtles_aux() :- findall((Start,End),estonian_kroon(Start,End),Interval1), findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_estonian_kroon_AND_teenage_mutant_ninja_turtles(Interval).

estonian_kroon_AND_teenage_mutant_ninja_turtles_at_2010(Res) :- setof((Start,End),estonian_kroon_AND_teenage_mutant_ninja_turtles(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_AND_teenage_mutant_ninja_turtles_at_2010'), (estonian_kroon_AND_teenage_mutant_ninja_turtles_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- estonian_kroon_AND_teenage_mutant_ninja_turtles_aux().

