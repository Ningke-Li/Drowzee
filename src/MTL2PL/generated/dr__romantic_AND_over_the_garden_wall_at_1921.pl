:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

over_the_garden_wall(Start,End) :- begin('over_the_garden_wall',_,_,Start), end('over_the_garden_wall',_,_,End), Start=<End.

generate_facts_dr__romantic_AND_over_the_garden_wall([]) :- assert(dr__romantic_AND_over_the_garden_wall(-1,-1)).

generate_facts_dr__romantic_AND_over_the_garden_wall([(Start,End) | Tail]) :- assert(dr__romantic_AND_over_the_garden_wall(Start,End)), generate_facts_dr__romantic_AND_over_the_garden_wall(Tail).

dr__romantic_AND_over_the_garden_wall_aux() :- findall((Start,End),dr__romantic(Start,End),Interval1), findall((Start,End),over_the_garden_wall(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dr__romantic_AND_over_the_garden_wall(Interval).

dr__romantic_AND_over_the_garden_wall_at_1921(Res) :- setof((Start,End),dr__romantic_AND_over_the_garden_wall(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = dr__romantic_AND_over_the_garden_wall_at_1921'), (dr__romantic_AND_over_the_garden_wall_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dr__romantic_AND_over_the_garden_wall_aux().

