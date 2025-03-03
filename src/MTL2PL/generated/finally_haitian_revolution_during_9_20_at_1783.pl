:- include('database.pl').
haitian_revolution(Start,End) :- begin('haitian_revolution',_,_,Start), end('haitian_revolution',_,_,End), Start=<End.

finally_haitian_revolution_during_9_20(Start,End) :- haitian_revolution(Start1,End1), (Start1-20)=<(End1-9), Start is (Start1-20), End is (End1-9), Start=<End.

finally_haitian_revolution_during_9_20_at_1783(Res) :- setof((Start,End),finally_haitian_revolution_during_9_20(Start,End),AllINtervals), checkvalidity(1783,AllINtervals,Res).

check_query() :- write('Query = finally_haitian_revolution_during_9_20_at_1783'), (finally_haitian_revolution_during_9_20_at_1783(true) -> write('\nRes   = true');write('\nRes   = false')).

