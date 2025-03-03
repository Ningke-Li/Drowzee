:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

generate_facts_teenage_mutant_ninja_turtles_AND_el_chavo_animado([]) :- assert(teenage_mutant_ninja_turtles_AND_el_chavo_animado(-1,-1)).

generate_facts_teenage_mutant_ninja_turtles_AND_el_chavo_animado([(Start,End) | Tail]) :- assert(teenage_mutant_ninja_turtles_AND_el_chavo_animado(Start,End)), generate_facts_teenage_mutant_ninja_turtles_AND_el_chavo_animado(Tail).

teenage_mutant_ninja_turtles_AND_el_chavo_animado_aux() :- findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval1), findall((Start,End),el_chavo_animado(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_teenage_mutant_ninja_turtles_AND_el_chavo_animado(Interval).

teenage_mutant_ninja_turtles_AND_el_chavo_animado_at_2036(Res) :- setof((Start,End),teenage_mutant_ninja_turtles_AND_el_chavo_animado(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = teenage_mutant_ninja_turtles_AND_el_chavo_animado_at_2036'), (teenage_mutant_ninja_turtles_AND_el_chavo_animado_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- teenage_mutant_ninja_turtles_AND_el_chavo_animado_aux().

