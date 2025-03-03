:- include('database.pl').
july_revolution(Start,End) :- begin('july_revolution',_,_,Start), end('july_revolution',_,_,End), Start=<End.

finally_july_revolution_during_1_13(Start,End) :- july_revolution(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_july_revolution_during_1_13_at_1848(Res) :- setof((Start,End),finally_july_revolution_during_1_13(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = finally_july_revolution_during_1_13_at_1848'), (finally_july_revolution_during_1_13_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

