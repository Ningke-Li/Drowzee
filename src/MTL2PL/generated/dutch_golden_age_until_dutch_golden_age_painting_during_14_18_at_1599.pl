:- include('database.pl').
dutch_golden_age(Start,End) :- begin('dutch_golden_age',_,_,Start), end('dutch_golden_age',_,_,End), Start=<End.

dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

dutch_golden_age_last_till_14_18(Start,End) :- dutch_golden_age(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

dutch_golden_age_until_dutch_golden_age_painting_during_14_18_overlap(Start,End) :- dutch_golden_age_last_till_14_18(Start1,End1), dutch_golden_age_painting(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_golden_age_until_dutch_golden_age_painting_during_14_18(Start,End) :- dutch_golden_age(W1,_), dutch_golden_age_until_dutch_golden_age_painting_during_14_18_overlap(Start1,End1), Start is max((Start1-18),W1), End is (End1-14), Start=<End.

dutch_golden_age_until_dutch_golden_age_painting_during_14_18_at_1599(Res) :- setof((Start,End),dutch_golden_age_until_dutch_golden_age_painting_during_14_18(Start,End),AllINtervals), checkvalidity(1599,AllINtervals,Res).

check_query() :- write('Query = dutch_golden_age_until_dutch_golden_age_painting_during_14_18_at_1599'), (dutch_golden_age_until_dutch_golden_age_painting_during_14_18_at_1599(true) -> write('\nRes   = true');write('\nRes   = false')).

