:- include('database.pl').
mccarthyism(Start,End) :- begin('mccarthyism',_,_,Start), end('mccarthyism',_,_,End), Start=<End.

next_mccarthyism(Start,End) :- mccarthyism(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_mccarthyism_at_1943(Res) :- setof((Start,End),next_mccarthyism(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = next_mccarthyism_at_1943'), (next_mccarthyism_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).

