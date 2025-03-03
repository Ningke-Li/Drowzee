:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

finally_the_walking_dead_during_5_11(Start,End) :- the_walking_dead(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

finally_the_walking_dead_during_5_11_at_2013(Res) :- setof((Start,End),finally_the_walking_dead_during_5_11(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = finally_the_walking_dead_during_5_11_at_2013'), (finally_the_walking_dead_during_5_11_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

