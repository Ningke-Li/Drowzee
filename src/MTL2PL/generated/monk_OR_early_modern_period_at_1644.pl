:- include('database.pl').
monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

early_modern_period(Start,End) :- begin('early_modern_period',_,_,Start), end('early_modern_period',_,_,End), Start=<End.

generate_facts_monk_OR_early_modern_period([]) :- assert(monk_OR_early_modern_period(-1,-1)).

generate_facts_monk_OR_early_modern_period([(Start,End) | Tail]) :- assert(monk_OR_early_modern_period(Start,End)), generate_facts_monk_OR_early_modern_period(Tail).

monk_OR_early_modern_period_aux() :- findall((Start,End),monk(Start,End),Interval1), findall((Start,End),early_modern_period(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_monk_OR_early_modern_period(Interval).

monk_OR_early_modern_period_at_1644(Res) :- setof((Start,End),monk_OR_early_modern_period(Start,End),AllINtervals), checkvalidity(1644,AllINtervals,Res).

check_query() :- write('Query = monk_OR_early_modern_period_at_1644'), (monk_OR_early_modern_period_at_1644(true) -> write('\nRes   = true');write('\nRes   = false')).
?- monk_OR_early_modern_period_aux().

