:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

servant_of_the_people(Start,End) :- begin('servant_of_the_people',_,_,Start), end('servant_of_the_people',_,_,End), Start=<End.

the_amazing_world_of_gumball_last_till_1_9(Start,End) :- the_amazing_world_of_gumball(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9_overlap(Start,End) :- the_amazing_world_of_gumball_last_till_1_9(Start1,End1), servant_of_the_people(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9(Start,End) :- the_amazing_world_of_gumball(W1,_), the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9_at_1886(Res) :- setof((Start,End),the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9_at_1886'), (the_amazing_world_of_gumball_until_servant_of_the_people_during_1_9_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).

