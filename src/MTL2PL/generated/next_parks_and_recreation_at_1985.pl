:- include('database.pl').
parks_and_recreation(Start,End) :- begin('parks_and_recreation',_,_,Start), end('parks_and_recreation',_,_,End), Start=<End.

next_parks_and_recreation(Start,End) :- parks_and_recreation(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_parks_and_recreation_at_1985(Res) :- setof((Start,End),next_parks_and_recreation(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = next_parks_and_recreation_at_1985'), (next_parks_and_recreation_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

