:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

generate_facts_cypriot_pound_AND_teenage_mutant_ninja_turtles([]) :- assert(cypriot_pound_AND_teenage_mutant_ninja_turtles(-1,-1)).

generate_facts_cypriot_pound_AND_teenage_mutant_ninja_turtles([(Start,End) | Tail]) :- assert(cypriot_pound_AND_teenage_mutant_ninja_turtles(Start,End)), generate_facts_cypriot_pound_AND_teenage_mutant_ninja_turtles(Tail).

cypriot_pound_AND_teenage_mutant_ninja_turtles_aux() :- findall((Start,End),cypriot_pound(Start,End),Interval1), findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_cypriot_pound_AND_teenage_mutant_ninja_turtles(Interval).

cypriot_pound_AND_teenage_mutant_ninja_turtles_at_2005(Res) :- setof((Start,End),cypriot_pound_AND_teenage_mutant_ninja_turtles(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = cypriot_pound_AND_teenage_mutant_ninja_turtles_at_2005'), (cypriot_pound_AND_teenage_mutant_ninja_turtles_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cypriot_pound_AND_teenage_mutant_ninja_turtles_aux().

