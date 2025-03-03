:- include('database.pl').
continental_system(Start,End) :- begin('continental_system',_,_,Start), end('continental_system',_,_,End), Start=<End.

finally_continental_system_during_10_19(Start,End) :- continental_system(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

finally_continental_system_during_10_19_at_1792(Res) :- setof((Start,End),finally_continental_system_during_10_19(Start,End),AllINtervals), checkvalidity(1792,AllINtervals,Res).

check_query() :- write('Query = finally_continental_system_during_10_19_at_1792'), (finally_continental_system_during_10_19_at_1792(true) -> write('\nRes   = true');write('\nRes   = false')).

