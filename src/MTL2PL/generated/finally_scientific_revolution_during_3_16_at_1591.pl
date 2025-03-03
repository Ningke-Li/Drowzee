:- include('database.pl').
scientific_revolution(Start,End) :- begin('scientific_revolution',_,_,Start), end('scientific_revolution',_,_,End), Start=<End.

finally_scientific_revolution_during_3_16(Start,End) :- scientific_revolution(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

finally_scientific_revolution_during_3_16_at_1591(Res) :- setof((Start,End),finally_scientific_revolution_during_3_16(Start,End),AllINtervals), checkvalidity(1591,AllINtervals,Res).

check_query() :- write('Query = finally_scientific_revolution_during_3_16_at_1591'), (finally_scientific_revolution_during_3_16_at_1591(true) -> write('\nRes   = true');write('\nRes   = false')).

