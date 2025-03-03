:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

good_luck_charlie(Start,End) :- begin('good_luck_charlie',_,_,Start), end('good_luck_charlie',_,_,End), Start=<End.

generate_facts_the_amazing_world_of_gumball_AND_good_luck_charlie([]) :- assert(the_amazing_world_of_gumball_AND_good_luck_charlie(-1,-1)).

generate_facts_the_amazing_world_of_gumball_AND_good_luck_charlie([(Start,End) | Tail]) :- assert(the_amazing_world_of_gumball_AND_good_luck_charlie(Start,End)), generate_facts_the_amazing_world_of_gumball_AND_good_luck_charlie(Tail).

the_amazing_world_of_gumball_AND_good_luck_charlie_aux() :- findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval1), findall((Start,End),good_luck_charlie(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_amazing_world_of_gumball_AND_good_luck_charlie(Interval).

the_amazing_world_of_gumball_AND_good_luck_charlie_at_2050(Res) :- setof((Start,End),the_amazing_world_of_gumball_AND_good_luck_charlie(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_AND_good_luck_charlie_at_2050'), (the_amazing_world_of_gumball_AND_good_luck_charlie_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_amazing_world_of_gumball_AND_good_luck_charlie_aux().

