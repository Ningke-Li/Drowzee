:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

next_peep_and_the_big_wide_world(Start,End) :- peep_and_the_big_wide_world(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_peep_and_the_big_wide_world_at_2033(Res) :- setof((Start,End),next_peep_and_the_big_wide_world(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = next_peep_and_the_big_wide_world_at_2033'), (next_peep_and_the_big_wide_world_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).

