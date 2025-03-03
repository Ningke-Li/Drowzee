:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

finally_the_amazing_world_of_gumball_during_10_13(Start,End) :- the_amazing_world_of_gumball(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

next_finally_the_amazing_world_of_gumball_during_10_13(Start,End) :- finally_the_amazing_world_of_gumball_during_10_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_amazing_world_of_gumball_during_10_13_at_1917(Res) :- setof((Start,End),next_finally_the_amazing_world_of_gumball_during_10_13(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_amazing_world_of_gumball_during_10_13_at_1917'), (next_finally_the_amazing_world_of_gumball_during_10_13_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

