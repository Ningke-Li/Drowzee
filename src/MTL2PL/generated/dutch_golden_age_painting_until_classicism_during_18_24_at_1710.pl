:- include('database.pl').
dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

classicism(Start,End) :- begin('classicism',_,_,Start), end('classicism',_,_,End), Start=<End.

dutch_golden_age_painting_last_till_18_24(Start,End) :- dutch_golden_age_painting(Start1,End1), (End1-Start1)>=18, Start is (Start1+18), End is (End1+1).

dutch_golden_age_painting_until_classicism_during_18_24_overlap(Start,End) :- dutch_golden_age_painting_last_till_18_24(Start1,End1), classicism(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_golden_age_painting_until_classicism_during_18_24(Start,End) :- dutch_golden_age_painting(W1,_), dutch_golden_age_painting_until_classicism_during_18_24_overlap(Start1,End1), Start is max((Start1-24),W1), End is (End1-18), Start=<End.

dutch_golden_age_painting_until_classicism_during_18_24_at_1710(Res) :- setof((Start,End),dutch_golden_age_painting_until_classicism_during_18_24(Start,End),AllINtervals), checkvalidity(1710,AllINtervals,Res).

check_query() :- write('Query = dutch_golden_age_painting_until_classicism_during_18_24_at_1710'), (dutch_golden_age_painting_until_classicism_during_18_24_at_1710(true) -> write('\nRes   = true');write('\nRes   = false')).

