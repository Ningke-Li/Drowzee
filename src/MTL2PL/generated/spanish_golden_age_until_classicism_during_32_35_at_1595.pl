:- include('database.pl').
spanish_golden_age(Start,End) :- begin('spanish_golden_age',_,_,Start), end('spanish_golden_age',_,_,End), Start=<End.

classicism(Start,End) :- begin('classicism',_,_,Start), end('classicism',_,_,End), Start=<End.

spanish_golden_age_last_till_32_35(Start,End) :- spanish_golden_age(Start1,End1), (End1-Start1)>=32, Start is (Start1+32), End is (End1+1).

spanish_golden_age_until_classicism_during_32_35_overlap(Start,End) :- spanish_golden_age_last_till_32_35(Start1,End1), classicism(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

spanish_golden_age_until_classicism_during_32_35(Start,End) :- spanish_golden_age(W1,_), spanish_golden_age_until_classicism_during_32_35_overlap(Start1,End1), Start is max((Start1-35),W1), End is (End1-32), Start=<End.

spanish_golden_age_until_classicism_during_32_35_at_1595(Res) :- setof((Start,End),spanish_golden_age_until_classicism_during_32_35(Start,End),AllINtervals), checkvalidity(1595,AllINtervals,Res).

check_query() :- write('Query = spanish_golden_age_until_classicism_during_32_35_at_1595'), (spanish_golden_age_until_classicism_during_32_35_at_1595(true) -> write('\nRes   = true');write('\nRes   = false')).

