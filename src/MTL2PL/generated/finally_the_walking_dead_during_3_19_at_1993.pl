:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

finally_the_walking_dead_during_3_19(Start,End) :- the_walking_dead(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

finally_the_walking_dead_during_3_19_at_1993(Res) :- setof((Start,End),finally_the_walking_dead_during_3_19(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_the_walking_dead_during_3_19_at_1993'), (finally_the_walking_dead_during_3_19_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

