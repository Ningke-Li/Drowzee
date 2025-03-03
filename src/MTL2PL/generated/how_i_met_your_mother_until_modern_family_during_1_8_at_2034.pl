:- include('database.pl').
how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

how_i_met_your_mother_last_till_1_8(Start,End) :- how_i_met_your_mother(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

how_i_met_your_mother_until_modern_family_during_1_8_overlap(Start,End) :- how_i_met_your_mother_last_till_1_8(Start1,End1), modern_family(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

how_i_met_your_mother_until_modern_family_during_1_8(Start,End) :- how_i_met_your_mother(W1,_), how_i_met_your_mother_until_modern_family_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

how_i_met_your_mother_until_modern_family_during_1_8_at_2034(Res) :- setof((Start,End),how_i_met_your_mother_until_modern_family_during_1_8(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = how_i_met_your_mother_until_modern_family_during_1_8_at_2034'), (how_i_met_your_mother_until_modern_family_during_1_8_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).

