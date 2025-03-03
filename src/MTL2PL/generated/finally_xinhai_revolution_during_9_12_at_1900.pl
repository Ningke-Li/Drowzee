:- include('database.pl').
xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

finally_xinhai_revolution_during_9_12(Start,End) :- xinhai_revolution(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_xinhai_revolution_during_9_12_at_1900(Res) :- setof((Start,End),finally_xinhai_revolution_during_9_12(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = finally_xinhai_revolution_during_9_12_at_1900'), (finally_xinhai_revolution_during_9_12_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

