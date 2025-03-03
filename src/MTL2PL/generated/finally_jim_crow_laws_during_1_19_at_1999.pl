:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

finally_jim_crow_laws_during_1_19(Start,End) :- jim_crow_laws(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_jim_crow_laws_during_1_19_at_1999(Res) :- setof((Start,End),finally_jim_crow_laws_during_1_19(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_jim_crow_laws_during_1_19_at_1999'), (finally_jim_crow_laws_during_1_19_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

