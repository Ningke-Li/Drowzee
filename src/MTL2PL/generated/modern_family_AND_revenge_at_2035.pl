:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

generate_facts_modern_family_AND_revenge([]) :- assert(modern_family_AND_revenge(-1,-1)).

generate_facts_modern_family_AND_revenge([(Start,End) | Tail]) :- assert(modern_family_AND_revenge(Start,End)), generate_facts_modern_family_AND_revenge(Tail).

modern_family_AND_revenge_aux() :- findall((Start,End),modern_family(Start,End),Interval1), findall((Start,End),revenge(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_modern_family_AND_revenge(Interval).

modern_family_AND_revenge_at_2035(Res) :- setof((Start,End),modern_family_AND_revenge(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = modern_family_AND_revenge_at_2035'), (modern_family_AND_revenge_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).
?- modern_family_AND_revenge_aux().

