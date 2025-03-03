:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

peep_and_the_big_wide_world_last_till_4_11(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

peep_and_the_big_wide_world_until_misfits_during_4_11_overlap(Start,End) :- peep_and_the_big_wide_world_last_till_4_11(Start1,End1), misfits(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peep_and_the_big_wide_world_until_misfits_during_4_11(Start,End) :- peep_and_the_big_wide_world(W1,_), peep_and_the_big_wide_world_until_misfits_during_4_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-4), Start=<End.

peep_and_the_big_wide_world_until_misfits_during_4_11_at_2022(Res) :- setof((Start,End),peep_and_the_big_wide_world_until_misfits_during_4_11(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_until_misfits_during_4_11_at_2022'), (peep_and_the_big_wide_world_until_misfits_during_4_11_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).

