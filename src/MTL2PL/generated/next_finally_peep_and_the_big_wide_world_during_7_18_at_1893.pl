:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

finally_peep_and_the_big_wide_world_during_7_18(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

next_finally_peep_and_the_big_wide_world_during_7_18(Start,End) :- finally_peep_and_the_big_wide_world_during_7_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_peep_and_the_big_wide_world_during_7_18_at_1893(Res) :- setof((Start,End),next_finally_peep_and_the_big_wide_world_during_7_18(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_finally_peep_and_the_big_wide_world_during_7_18_at_1893'), (next_finally_peep_and_the_big_wide_world_during_7_18_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

