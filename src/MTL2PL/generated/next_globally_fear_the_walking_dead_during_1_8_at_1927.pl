:- include('database.pl').
fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

globally_fear_the_walking_dead_during_1_8(Start,End) :- fear_the_walking_dead(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

next_globally_fear_the_walking_dead_during_1_8(Start,End) :- globally_fear_the_walking_dead_during_1_8(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_fear_the_walking_dead_during_1_8_at_1927(Res) :- setof((Start,End),next_globally_fear_the_walking_dead_during_1_8(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = next_globally_fear_the_walking_dead_during_1_8_at_1927'), (next_globally_fear_the_walking_dead_during_1_8_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

