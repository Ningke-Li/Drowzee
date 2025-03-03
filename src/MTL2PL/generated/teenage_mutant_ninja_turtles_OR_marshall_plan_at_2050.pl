:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

generate_facts_teenage_mutant_ninja_turtles_OR_marshall_plan([]) :- assert(teenage_mutant_ninja_turtles_OR_marshall_plan(-1,-1)).

generate_facts_teenage_mutant_ninja_turtles_OR_marshall_plan([(Start,End) | Tail]) :- assert(teenage_mutant_ninja_turtles_OR_marshall_plan(Start,End)), generate_facts_teenage_mutant_ninja_turtles_OR_marshall_plan(Tail).

teenage_mutant_ninja_turtles_OR_marshall_plan_aux() :- findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval1), findall((Start,End),marshall_plan(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_teenage_mutant_ninja_turtles_OR_marshall_plan(Interval).

teenage_mutant_ninja_turtles_OR_marshall_plan_at_2050(Res) :- setof((Start,End),teenage_mutant_ninja_turtles_OR_marshall_plan(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = teenage_mutant_ninja_turtles_OR_marshall_plan_at_2050'), (teenage_mutant_ninja_turtles_OR_marshall_plan_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- teenage_mutant_ninja_turtles_OR_marshall_plan_aux().

