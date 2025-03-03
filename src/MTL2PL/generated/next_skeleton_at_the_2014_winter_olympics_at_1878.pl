:- include('database.pl').
skeleton_at_the_2014_winter_olympics(Start,End) :- begin('skeleton_at_the_2014_winter_olympics',_,_,Start), end('skeleton_at_the_2014_winter_olympics',_,_,End), Start=<End.

next_skeleton_at_the_2014_winter_olympics(Start,End) :- skeleton_at_the_2014_winter_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_skeleton_at_the_2014_winter_olympics_at_1878(Res) :- setof((Start,End),next_skeleton_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = next_skeleton_at_the_2014_winter_olympics_at_1878'), (next_skeleton_at_the_2014_winter_olympics_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).

