:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

generate_facts_the_amazing_world_of_gumball_AND_ncis__los_angeles([]) :- assert(the_amazing_world_of_gumball_AND_ncis__los_angeles(-1,-1)).

generate_facts_the_amazing_world_of_gumball_AND_ncis__los_angeles([(Start,End) | Tail]) :- assert(the_amazing_world_of_gumball_AND_ncis__los_angeles(Start,End)), generate_facts_the_amazing_world_of_gumball_AND_ncis__los_angeles(Tail).

the_amazing_world_of_gumball_AND_ncis__los_angeles_aux() :- findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval1), findall((Start,End),ncis__los_angeles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_amazing_world_of_gumball_AND_ncis__los_angeles(Interval).

the_amazing_world_of_gumball_AND_ncis__los_angeles_at_1955(Res) :- setof((Start,End),the_amazing_world_of_gumball_AND_ncis__los_angeles(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_AND_ncis__los_angeles_at_1955'), (the_amazing_world_of_gumball_AND_ncis__los_angeles_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_amazing_world_of_gumball_AND_ncis__los_angeles_aux().

