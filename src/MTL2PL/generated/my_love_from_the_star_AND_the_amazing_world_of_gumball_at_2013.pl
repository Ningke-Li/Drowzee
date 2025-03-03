:- include('database.pl').
my_love_from_the_star(Start,End) :- begin('my_love_from_the_star',_,_,Start), end('my_love_from_the_star',_,_,End), Start=<End.

the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

generate_facts_my_love_from_the_star_AND_the_amazing_world_of_gumball([]) :- assert(my_love_from_the_star_AND_the_amazing_world_of_gumball(-1,-1)).

generate_facts_my_love_from_the_star_AND_the_amazing_world_of_gumball([(Start,End) | Tail]) :- assert(my_love_from_the_star_AND_the_amazing_world_of_gumball(Start,End)), generate_facts_my_love_from_the_star_AND_the_amazing_world_of_gumball(Tail).

my_love_from_the_star_AND_the_amazing_world_of_gumball_aux() :- findall((Start,End),my_love_from_the_star(Start,End),Interval1), findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_my_love_from_the_star_AND_the_amazing_world_of_gumball(Interval).

my_love_from_the_star_AND_the_amazing_world_of_gumball_at_2013(Res) :- setof((Start,End),my_love_from_the_star_AND_the_amazing_world_of_gumball(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = my_love_from_the_star_AND_the_amazing_world_of_gumball_at_2013'), (my_love_from_the_star_AND_the_amazing_world_of_gumball_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- my_love_from_the_star_AND_the_amazing_world_of_gumball_aux().

