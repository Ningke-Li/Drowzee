:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

globally_peep_and_the_big_wide_world_during_1_5(Start,End) :- peep_and_the_big_wide_world(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

next_globally_peep_and_the_big_wide_world_during_1_5(Start,End) :- globally_peep_and_the_big_wide_world_during_1_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_peep_and_the_big_wide_world_during_1_5_at_1902(Res) :- setof((Start,End),next_globally_peep_and_the_big_wide_world_during_1_5(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = next_globally_peep_and_the_big_wide_world_during_1_5_at_1902'), (next_globally_peep_and_the_big_wide_world_during_1_5_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

