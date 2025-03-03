:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

next_the_amazing_world_of_gumball(Start,End) :- the_amazing_world_of_gumball(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_amazing_world_of_gumball_at_2068(Res) :- setof((Start,End),next_the_amazing_world_of_gumball(Start,End),AllINtervals), checkvalidity(2068,AllINtervals,Res).

check_query() :- write('Query = next_the_amazing_world_of_gumball_at_2068'), (next_the_amazing_world_of_gumball_at_2068(true) -> write('\nRes   = true');write('\nRes   = false')).

