:- include('database.pl').
dutch_golden_age(Start,End) :- begin('dutch_golden_age',_,_,Start), end('dutch_golden_age',_,_,End), Start=<End.

globally_dutch_golden_age_during_97_98(Start,End) :- dutch_golden_age(Start1,End1), Start is (Start1-97), End is (End1-98), Start=<End.

globally_dutch_golden_age_during_97_98_at_1563(Res) :- setof((Start,End),globally_dutch_golden_age_during_97_98(Start,End),AllINtervals), checkvalidity(1563,AllINtervals,Res).

check_query() :- write('Query = globally_dutch_golden_age_during_97_98_at_1563'), (globally_dutch_golden_age_during_97_98_at_1563(true) -> write('\nRes   = true');write('\nRes   = false')).

