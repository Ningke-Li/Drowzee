:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

february_2015(Start,End) :- begin('february_2015',_,_,Start), end('february_2015',_,_,End), Start=<End.

generate_facts_the_amazing_world_of_gumball_OR_february_2015([]) :- assert(the_amazing_world_of_gumball_OR_february_2015(-1,-1)).

generate_facts_the_amazing_world_of_gumball_OR_february_2015([(Start,End) | Tail]) :- assert(the_amazing_world_of_gumball_OR_february_2015(Start,End)), generate_facts_the_amazing_world_of_gumball_OR_february_2015(Tail).

the_amazing_world_of_gumball_OR_february_2015_aux() :- findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval1), findall((Start,End),february_2015(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_amazing_world_of_gumball_OR_february_2015(Interval).

the_amazing_world_of_gumball_OR_february_2015_at_1938(Res) :- setof((Start,End),the_amazing_world_of_gumball_OR_february_2015(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_OR_february_2015_at_1938'), (the_amazing_world_of_gumball_OR_february_2015_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_amazing_world_of_gumball_OR_february_2015_aux().

