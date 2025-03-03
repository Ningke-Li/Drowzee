:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

generate_facts_lazytown_OR_dutch_golden_age_painting([]) :- assert(lazytown_OR_dutch_golden_age_painting(-1,-1)).

generate_facts_lazytown_OR_dutch_golden_age_painting([(Start,End) | Tail]) :- assert(lazytown_OR_dutch_golden_age_painting(Start,End)), generate_facts_lazytown_OR_dutch_golden_age_painting(Tail).

lazytown_OR_dutch_golden_age_painting_aux() :- findall((Start,End),lazytown(Start,End),Interval1), findall((Start,End),dutch_golden_age_painting(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_lazytown_OR_dutch_golden_age_painting(Interval).

lazytown_OR_dutch_golden_age_painting_at_1678(Res) :- setof((Start,End),lazytown_OR_dutch_golden_age_painting(Start,End),AllINtervals), checkvalidity(1678,AllINtervals,Res).

check_query() :- write('Query = lazytown_OR_dutch_golden_age_painting_at_1678'), (lazytown_OR_dutch_golden_age_painting_at_1678(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lazytown_OR_dutch_golden_age_painting_aux().

