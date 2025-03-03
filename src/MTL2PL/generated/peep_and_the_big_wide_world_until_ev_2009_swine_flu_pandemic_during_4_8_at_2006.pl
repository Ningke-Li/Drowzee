:- include('database.pl').
peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

ev_2009_swine_flu_pandemic(Start,End) :- begin('ev_2009_swine_flu_pandemic',_,_,Start), end('ev_2009_swine_flu_pandemic',_,_,End), Start=<End.

peep_and_the_big_wide_world_last_till_4_8(Start,End) :- peep_and_the_big_wide_world(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8_overlap(Start,End) :- peep_and_the_big_wide_world_last_till_4_8(Start1,End1), ev_2009_swine_flu_pandemic(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8(Start,End) :- peep_and_the_big_wide_world(W1,_), peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8_at_2006(Res) :- setof((Start,End),peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8_at_2006'), (peep_and_the_big_wide_world_until_ev_2009_swine_flu_pandemic_during_4_8_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

