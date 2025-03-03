:- include('database.pl').
first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

finally_first_serbian_uprising_during_8_14(Start,End) :- first_serbian_uprising(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_first_serbian_uprising_during_8_14_at_1805(Res) :- setof((Start,End),finally_first_serbian_uprising_during_8_14(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = finally_first_serbian_uprising_during_8_14_at_1805'), (finally_first_serbian_uprising_during_8_14_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).

