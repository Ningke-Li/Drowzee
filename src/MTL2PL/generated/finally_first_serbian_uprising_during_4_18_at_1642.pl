:- include('database.pl').
first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

finally_first_serbian_uprising_during_4_18(Start,End) :- first_serbian_uprising(Start1,End1), (Start1-18)=<(End1-4), Start is (Start1-18), End is (End1-4), Start=<End.

finally_first_serbian_uprising_during_4_18_at_1642(Res) :- setof((Start,End),finally_first_serbian_uprising_during_4_18(Start,End),AllINtervals), checkvalidity(1642,AllINtervals,Res).

check_query() :- write('Query = finally_first_serbian_uprising_during_4_18_at_1642'), (finally_first_serbian_uprising_during_4_18_at_1642(true) -> write('\nRes   = true');write('\nRes   = false')).

