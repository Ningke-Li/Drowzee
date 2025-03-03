:- include('database.pl').
mccarthyism(Start,End) :- begin('mccarthyism',_,_,Start), end('mccarthyism',_,_,End), Start=<End.

globally_mccarthyism_during_1_4(Start,End) :- mccarthyism(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_mccarthyism_during_1_4_at_1846(Res) :- setof((Start,End),globally_mccarthyism_during_1_4(Start,End),AllINtervals), checkvalidity(1846,AllINtervals,Res).

check_query() :- write('Query = globally_mccarthyism_during_1_4_at_1846'), (globally_mccarthyism_during_1_4_at_1846(true) -> write('\nRes   = true');write('\nRes   = false')).

