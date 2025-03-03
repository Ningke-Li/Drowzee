:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

finally_modern_family_during_6_16(Start,End) :- modern_family(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

globally_finally_modern_family_during_6_16_during_1_21(Start,End) :- finally_modern_family_during_6_16(Start1,End1), Start is (Start1-1), End is (End1-21), Start=<End.

globally_finally_modern_family_during_6_16_during_1_21_at_1992(Res) :- setof((Start,End),globally_finally_modern_family_during_6_16_during_1_21(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = globally_finally_modern_family_during_6_16_during_1_21_at_1992'), (globally_finally_modern_family_during_6_16_during_1_21_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

