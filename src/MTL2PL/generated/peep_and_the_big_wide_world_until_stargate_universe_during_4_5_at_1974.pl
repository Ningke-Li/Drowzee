:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

peep_and_the_big_wide_world_last_till_4_5(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

peep_and_the_big_wide_world_until_stargate_universe_during_4_5_overlap(Start,End) :- peep_and_the_big_wide_world_last_till_4_5(Start1,End1), stargate_universe(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peep_and_the_big_wide_world_until_stargate_universe_during_4_5(Start,End) :- peep_and_the_big_wide_world(W1,_), peep_and_the_big_wide_world_until_stargate_universe_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

peep_and_the_big_wide_world_until_stargate_universe_during_4_5_at_1974(Res) :- setof((Start,End),peep_and_the_big_wide_world_until_stargate_universe_during_4_5(Start,End),AllINtervals), checkvalidity(1974,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_until_stargate_universe_during_4_5_at_1974'), (peep_and_the_big_wide_world_until_stargate_universe_during_4_5_at_1974(true) -> write('\nRes   = true');write('\nRes   = false')).

