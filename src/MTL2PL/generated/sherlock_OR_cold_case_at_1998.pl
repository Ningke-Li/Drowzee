:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

generate_facts_sherlock_OR_cold_case([]) :- assert(sherlock_OR_cold_case(-1,-1)).

generate_facts_sherlock_OR_cold_case([(Start,End) | Tail]) :- assert(sherlock_OR_cold_case(Start,End)), generate_facts_sherlock_OR_cold_case(Tail).

sherlock_OR_cold_case_aux() :- findall((Start,End),sherlock(Start,End),Interval1), findall((Start,End),cold_case(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sherlock_OR_cold_case(Interval).

sherlock_OR_cold_case_at_1998(Res) :- setof((Start,End),sherlock_OR_cold_case(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = sherlock_OR_cold_case_at_1998'), (sherlock_OR_cold_case_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sherlock_OR_cold_case_aux().

