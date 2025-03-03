:- include('database.pl').
warsaw_ghetto_uprising(Start,End) :- begin('warsaw_ghetto_uprising',_,_,Start), end('warsaw_ghetto_uprising',_,_,End), Start=<End.

finally_warsaw_ghetto_uprising_during_9_11(Start,End) :- warsaw_ghetto_uprising(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_warsaw_ghetto_uprising_during_9_11_at_1821(Res) :- setof((Start,End),finally_warsaw_ghetto_uprising_during_9_11(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = finally_warsaw_ghetto_uprising_during_9_11_at_1821'), (finally_warsaw_ghetto_uprising_during_9_11_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).

