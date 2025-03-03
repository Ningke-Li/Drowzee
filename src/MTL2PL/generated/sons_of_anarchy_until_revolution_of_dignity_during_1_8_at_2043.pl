:- include('database.pl').
sons_of_anarchy(Start,End) :- begin('sons_of_anarchy',_,_,Start), end('sons_of_anarchy',_,_,End), Start=<End.

revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

sons_of_anarchy_last_till_1_8(Start,End) :- sons_of_anarchy(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

sons_of_anarchy_until_revolution_of_dignity_during_1_8_overlap(Start,End) :- sons_of_anarchy_last_till_1_8(Start1,End1), revolution_of_dignity(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sons_of_anarchy_until_revolution_of_dignity_during_1_8(Start,End) :- sons_of_anarchy(W1,_), sons_of_anarchy_until_revolution_of_dignity_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

sons_of_anarchy_until_revolution_of_dignity_during_1_8_at_2043(Res) :- setof((Start,End),sons_of_anarchy_until_revolution_of_dignity_during_1_8(Start,End),AllINtervals), checkvalidity(2043,AllINtervals,Res).

check_query() :- write('Query = sons_of_anarchy_until_revolution_of_dignity_during_1_8_at_2043'), (sons_of_anarchy_until_revolution_of_dignity_during_1_8_at_2043(true) -> write('\nRes   = true');write('\nRes   = false')).

