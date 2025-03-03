:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

shameless_last_till_1_3(Start,End) :- shameless(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

shameless_until_fear_the_walking_dead_during_1_3_overlap(Start,End) :- shameless_last_till_1_3(Start1,End1), fear_the_walking_dead(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

shameless_until_fear_the_walking_dead_during_1_3(Start,End) :- shameless(W1,_), shameless_until_fear_the_walking_dead_during_1_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-1), Start=<End.

shameless_until_fear_the_walking_dead_during_1_3_at_2015(Res) :- setof((Start,End),shameless_until_fear_the_walking_dead_during_1_3(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = shameless_until_fear_the_walking_dead_during_1_3_at_2015'), (shameless_until_fear_the_walking_dead_during_1_3_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

