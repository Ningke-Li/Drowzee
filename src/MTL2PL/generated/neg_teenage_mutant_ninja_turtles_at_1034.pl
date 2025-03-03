:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

compare_teenage_mutant_ninja_turtles(Dir,teenage_mutant_ninja_turtles(Start1,_),teenage_mutant_ninja_turtles(Start2,_)) :- Start1=<Start2.

generate_neg_teenage_mutant_ninja_turtles([]).

generate_neg_teenage_mutant_ninja_turtles([(Start,End) | Tail]) :- assert(neg_teenage_mutant_ninja_turtles(Start,End)), generate_neg_teenage_mutant_ninja_turtles(Tail).

sort_teenage_mutant_ninja_turtles(SortedIntervals) :- findall((Start,End),teenage_mutant_ninja_turtles(Start,End),UnsortedIntervals), predsort(compare_teenage_mutant_ninja_turtles,UnsortedIntervals,SortedIntervals).

generate_neg_teenage_mutant_ninja_turtles_aux() :- sort_teenage_mutant_ninja_turtles(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_teenage_mutant_ninja_turtles(NegatedIntervals).

neg_teenage_mutant_ninja_turtles_at_1034(Res) :- setof((Start,End),neg_teenage_mutant_ninja_turtles(Start,End),AllINtervals), checkvalidity(1034,AllINtervals,Res).

check_query() :- write('Query = neg_teenage_mutant_ninja_turtles_at_1034'), (neg_teenage_mutant_ninja_turtles_at_1034(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_teenage_mutant_ninja_turtles_aux().

