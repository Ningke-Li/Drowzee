:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

peep_and_the_big_wide_world_last_till_1_8(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8_overlap(Start,End) :- peep_and_the_big_wide_world_last_till_1_8(Start1,End1), the_big_bang_theory(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8(Start,End) :- peep_and_the_big_wide_world(W1,_), peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8_at_1929(Res) :- setof((Start,End),peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8_at_1929'), (peep_and_the_big_wide_world_until_the_big_bang_theory_during_1_8_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

