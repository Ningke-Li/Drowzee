:- include('database.pl').
dutch_golden_age(Start,End) :- begin('dutch_golden_age',_,_,Start), end('dutch_golden_age',_,_,End), Start=<End.

finally_dutch_golden_age_during_8_17(Start,End) :- dutch_golden_age(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

globally_finally_dutch_golden_age_during_8_17_during_36_102(Start,End) :- finally_dutch_golden_age_during_8_17(Start1,End1), Start is (Start1-36), End is (End1-102), Start=<End.

globally_finally_dutch_golden_age_during_8_17_during_36_102_at_1555(Res) :- setof((Start,End),globally_finally_dutch_golden_age_during_8_17_during_36_102(Start,End),AllINtervals), checkvalidity(1555,AllINtervals,Res).

check_query() :- write('Query = globally_finally_dutch_golden_age_during_8_17_during_36_102_at_1555'), (globally_finally_dutch_golden_age_during_8_17_during_36_102_at_1555(true) -> write('\nRes   = true');write('\nRes   = false')).

