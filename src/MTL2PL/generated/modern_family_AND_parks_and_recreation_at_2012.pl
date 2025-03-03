:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

parks_and_recreation(Start,End) :- begin('parks_and_recreation',_,_,Start), end('parks_and_recreation',_,_,End), Start=<End.

generate_facts_modern_family_AND_parks_and_recreation([]) :- assert(modern_family_AND_parks_and_recreation(-1,-1)).

generate_facts_modern_family_AND_parks_and_recreation([(Start,End) | Tail]) :- assert(modern_family_AND_parks_and_recreation(Start,End)), generate_facts_modern_family_AND_parks_and_recreation(Tail).

modern_family_AND_parks_and_recreation_aux() :- findall((Start,End),modern_family(Start,End),Interval1), findall((Start,End),parks_and_recreation(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_modern_family_AND_parks_and_recreation(Interval).

modern_family_AND_parks_and_recreation_at_2012(Res) :- setof((Start,End),modern_family_AND_parks_and_recreation(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = modern_family_AND_parks_and_recreation_at_2012'), (modern_family_AND_parks_and_recreation_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- modern_family_AND_parks_and_recreation_aux().

