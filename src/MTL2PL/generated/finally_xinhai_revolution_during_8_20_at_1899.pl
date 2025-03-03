:- include('database.pl').
xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

finally_xinhai_revolution_during_8_20(Start,End) :- xinhai_revolution(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

finally_xinhai_revolution_during_8_20_at_1899(Res) :- setof((Start,End),finally_xinhai_revolution_during_8_20(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = finally_xinhai_revolution_during_8_20_at_1899'), (finally_xinhai_revolution_during_8_20_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

