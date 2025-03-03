:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

finally_jim_crow_laws_during_4_20(Start,End) :- jim_crow_laws(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_jim_crow_laws_during_4_20_at_1884(Res) :- setof((Start,End),finally_jim_crow_laws_during_4_20(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = finally_jim_crow_laws_during_4_20_at_1884'), (finally_jim_crow_laws_during_4_20_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

