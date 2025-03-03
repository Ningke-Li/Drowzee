:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

the_amazing_world_of_gumball_last_till_1_9(Start,End) :- the_amazing_world_of_gumball(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_amazing_world_of_gumball_until_we_bare_bears_during_1_9_overlap(Start,End) :- the_amazing_world_of_gumball_last_till_1_9(Start1,End1), we_bare_bears(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_amazing_world_of_gumball_until_we_bare_bears_during_1_9(Start,End) :- the_amazing_world_of_gumball(W1,_), the_amazing_world_of_gumball_until_we_bare_bears_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

the_amazing_world_of_gumball_until_we_bare_bears_during_1_9_at_1932(Res) :- setof((Start,End),the_amazing_world_of_gumball_until_we_bare_bears_during_1_9(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_until_we_bare_bears_during_1_9_at_1932'), (the_amazing_world_of_gumball_until_we_bare_bears_during_1_9_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).

