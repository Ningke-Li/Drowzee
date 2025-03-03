:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

generate_facts_the_amazing_world_of_gumball_AND_the_newsroom([]) :- assert(the_amazing_world_of_gumball_AND_the_newsroom(-1,-1)).

generate_facts_the_amazing_world_of_gumball_AND_the_newsroom([(Start,End) | Tail]) :- assert(the_amazing_world_of_gumball_AND_the_newsroom(Start,End)), generate_facts_the_amazing_world_of_gumball_AND_the_newsroom(Tail).

the_amazing_world_of_gumball_AND_the_newsroom_aux() :- findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval1), findall((Start,End),the_newsroom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_amazing_world_of_gumball_AND_the_newsroom(Interval).

the_amazing_world_of_gumball_AND_the_newsroom_at_2014(Res) :- setof((Start,End),the_amazing_world_of_gumball_AND_the_newsroom(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_AND_the_newsroom_at_2014'), (the_amazing_world_of_gumball_AND_the_newsroom_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_amazing_world_of_gumball_AND_the_newsroom_aux().

