:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

the_suite_life_of_zack___cody(Start,End) :- begin('the_suite_life_of_zack___cody',_,_,Start), end('the_suite_life_of_zack___cody',_,_,End), Start=<End.

ev_24_last_till_2_10(Start,End) :- ev_24(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_24_until_the_suite_life_of_zack___cody_during_2_10_overlap(Start,End) :- ev_24_last_till_2_10(Start1,End1), the_suite_life_of_zack___cody(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_24_until_the_suite_life_of_zack___cody_during_2_10(Start,End) :- ev_24(W1,_), ev_24_until_the_suite_life_of_zack___cody_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

ev_24_until_the_suite_life_of_zack___cody_during_2_10_at_1876(Res) :- setof((Start,End),ev_24_until_the_suite_life_of_zack___cody_during_2_10(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = ev_24_until_the_suite_life_of_zack___cody_during_2_10_at_1876'), (ev_24_until_the_suite_life_of_zack___cody_during_2_10_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

