:- include('database.pl').
fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

globally_fear_the_walking_dead_during_1_8(Start,End) :- fear_the_walking_dead(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

globally_fear_the_walking_dead_during_1_8_at_2015(Res) :- setof((Start,End),globally_fear_the_walking_dead_during_1_8(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = globally_fear_the_walking_dead_during_1_8_at_2015'), (globally_fear_the_walking_dead_during_1_8_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

