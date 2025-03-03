:- include('database.pl').
dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

globally_dutch_golden_age_painting_during_14_84(Start,End) :- dutch_golden_age_painting(Start1,End1), Start is (Start1-14), End is (End1-84), Start=<End.

globally_dutch_golden_age_painting_during_14_84_at_1597(Res) :- setof((Start,End),globally_dutch_golden_age_painting_during_14_84(Start,End),AllINtervals), checkvalidity(1597,AllINtervals,Res).

check_query() :- write('Query = globally_dutch_golden_age_painting_during_14_84_at_1597'), (globally_dutch_golden_age_painting_during_14_84_at_1597(true) -> write('\nRes   = true');write('\nRes   = false')).

