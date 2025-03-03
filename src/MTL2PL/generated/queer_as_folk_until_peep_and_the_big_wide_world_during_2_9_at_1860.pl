:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

peep_and_the_big_wide_world(Start,End) :- begin('peep_and_the_big_wide_world',_,_,Start), end('peep_and_the_big_wide_world',_,_,End), Start=<End.

queer_as_folk_last_till_2_9(Start,End) :- queer_as_folk(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

queer_as_folk_until_peep_and_the_big_wide_world_during_2_9_overlap(Start,End) :- queer_as_folk_last_till_2_9(Start1,End1), peep_and_the_big_wide_world(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

queer_as_folk_until_peep_and_the_big_wide_world_during_2_9(Start,End) :- queer_as_folk(W1,_), queer_as_folk_until_peep_and_the_big_wide_world_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

queer_as_folk_until_peep_and_the_big_wide_world_during_2_9_at_1860(Res) :- setof((Start,End),queer_as_folk_until_peep_and_the_big_wide_world_during_2_9(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = queer_as_folk_until_peep_and_the_big_wide_world_during_2_9_at_1860'), (queer_as_folk_until_peep_and_the_big_wide_world_during_2_9_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

