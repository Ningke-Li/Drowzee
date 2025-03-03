:- include('database.pl').
mole(Start,End) :- begin('mole',_,_,Start), end('mole',_,_,End), Start=<End.

finally_mole_during_2_16(Start,End) :- mole(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

globally_finally_mole_during_2_16_during_24_57(Start,End) :- finally_mole_during_2_16(Start1,End1), Start is (Start1-24), End is (End1-57), Start=<End.

globally_finally_mole_during_2_16_during_24_57_at_1926(Res) :- setof((Start,End),globally_finally_mole_during_2_16_during_24_57(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mole_during_2_16_during_24_57_at_1926'), (globally_finally_mole_during_2_16_during_24_57_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

