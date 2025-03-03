:- include('database.pl').
occupation_of_the_ruhr(Start,End) :- begin('occupation_of_the_ruhr',_,_,Start), end('occupation_of_the_ruhr',_,_,End), Start=<End.

finally_occupation_of_the_ruhr_during_9_19(Start,End) :- occupation_of_the_ruhr(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_occupation_of_the_ruhr_during_9_19_at_1790(Res) :- setof((Start,End),finally_occupation_of_the_ruhr_during_9_19(Start,End),AllINtervals), checkvalidity(1790,AllINtervals,Res).

check_query() :- write('Query = finally_occupation_of_the_ruhr_during_9_19_at_1790'), (finally_occupation_of_the_ruhr_during_9_19_at_1790(true) -> write('\nRes   = true');write('\nRes   = false')).

