:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

finally_peep_and_the_big_wide_world_during_9_17(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_peep_and_the_big_wide_world_during_9_17_at_1998(Res) :- setof((Start,End),finally_peep_and_the_big_wide_world_during_9_17(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = finally_peep_and_the_big_wide_world_during_9_17_at_1998'), (finally_peep_and_the_big_wide_world_during_9_17_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

