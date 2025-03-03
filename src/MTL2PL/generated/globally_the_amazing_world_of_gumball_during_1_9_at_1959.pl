:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

globally_the_amazing_world_of_gumball_during_1_9(Start,End) :- the_amazing_world_of_gumball(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

globally_the_amazing_world_of_gumball_during_1_9_at_1959(Res) :- setof((Start,End),globally_the_amazing_world_of_gumball_during_1_9(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = globally_the_amazing_world_of_gumball_during_1_9_at_1959'), (globally_the_amazing_world_of_gumball_during_1_9_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

