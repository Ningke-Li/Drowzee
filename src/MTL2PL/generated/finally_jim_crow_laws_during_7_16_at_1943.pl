:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

finally_jim_crow_laws_during_7_16(Start,End) :- jim_crow_laws(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_jim_crow_laws_during_7_16_at_1943(Res) :- setof((Start,End),finally_jim_crow_laws_during_7_16(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = finally_jim_crow_laws_during_7_16_at_1943'), (finally_jim_crow_laws_during_7_16_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).

