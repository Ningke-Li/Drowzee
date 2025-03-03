:- include('database.pl').
november_uprising(Start,End) :- begin('november_uprising',_,_,Start), end('november_uprising',_,_,End), Start=<End.

next_november_uprising(Start,End) :- november_uprising(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_november_uprising_at_1727(Res) :- setof((Start,End),next_november_uprising(Start,End),AllINtervals), checkvalidity(1727,AllINtervals,Res).

check_query() :- write('Query = next_november_uprising_at_1727'), (next_november_uprising_at_1727(true) -> write('\nRes   = true');write('\nRes   = false')).

