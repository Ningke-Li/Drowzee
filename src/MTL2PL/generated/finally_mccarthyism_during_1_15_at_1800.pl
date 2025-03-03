:- include('database.pl').
mccarthyism(Start,End) :- begin('mccarthyism',_,_,Start), end('mccarthyism',_,_,End), Start=<End.

finally_mccarthyism_during_1_15(Start,End) :- mccarthyism(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_mccarthyism_during_1_15_at_1800(Res) :- setof((Start,End),finally_mccarthyism_during_1_15(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = finally_mccarthyism_during_1_15_at_1800'), (finally_mccarthyism_during_1_15_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).

