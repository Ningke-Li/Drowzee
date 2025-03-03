:- include('database.pl').
dutch_golden_age(Start,End) :- begin('dutch_golden_age',_,_,Start), end('dutch_golden_age',_,_,End), Start=<End.

globally_dutch_golden_age_during_32_94(Start,End) :- dutch_golden_age(Start1,End1), Start is (Start1-32), End is (End1-94), Start=<End.

finally_globally_dutch_golden_age_during_32_94_during_1_18(Start,End) :- globally_dutch_golden_age_during_32_94(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_globally_dutch_golden_age_during_32_94_during_1_18_at_1443(Res) :- setof((Start,End),finally_globally_dutch_golden_age_during_32_94_during_1_18(Start,End),AllINtervals), checkvalidity(1443,AllINtervals,Res).

check_query() :- write('Query = finally_globally_dutch_golden_age_during_32_94_during_1_18_at_1443'), (finally_globally_dutch_golden_age_during_32_94_during_1_18_at_1443(true) -> write('\nRes   = true');write('\nRes   = false')).

