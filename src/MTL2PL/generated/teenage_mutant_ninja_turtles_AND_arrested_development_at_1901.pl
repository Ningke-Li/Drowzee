:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

generate_facts_teenage_mutant_ninja_turtles_AND_arrested_development([]) :- assert(teenage_mutant_ninja_turtles_AND_arrested_development(-1,-1)).

generate_facts_teenage_mutant_ninja_turtles_AND_arrested_development([(Start,End) | Tail]) :- assert(teenage_mutant_ninja_turtles_AND_arrested_development(Start,End)), generate_facts_teenage_mutant_ninja_turtles_AND_arrested_development(Tail).

teenage_mutant_ninja_turtles_AND_arrested_development_aux() :- findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval1), findall((Start,End),arrested_development(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_teenage_mutant_ninja_turtles_AND_arrested_development(Interval).

teenage_mutant_ninja_turtles_AND_arrested_development_at_1901(Res) :- setof((Start,End),teenage_mutant_ninja_turtles_AND_arrested_development(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = teenage_mutant_ninja_turtles_AND_arrested_development_at_1901'), (teenage_mutant_ninja_turtles_AND_arrested_development_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- teenage_mutant_ninja_turtles_AND_arrested_development_aux().

