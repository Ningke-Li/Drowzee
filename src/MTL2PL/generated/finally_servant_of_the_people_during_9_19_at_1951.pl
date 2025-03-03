:- include('database.pl').
servant_of_the_people(Start,End) :- begin('servant_of_the_people',_,_,Start), end('servant_of_the_people',_,_,End), Start=<End.

finally_servant_of_the_people_during_9_19(Start,End) :- servant_of_the_people(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_servant_of_the_people_during_9_19_at_1951(Res) :- setof((Start,End),finally_servant_of_the_people_during_9_19(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = finally_servant_of_the_people_during_9_19_at_1951'), (finally_servant_of_the_people_during_9_19_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

