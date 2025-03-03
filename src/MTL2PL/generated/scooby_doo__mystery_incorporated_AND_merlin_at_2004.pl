:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

generate_facts_scooby_doo__mystery_incorporated_AND_merlin([]) :- assert(scooby_doo__mystery_incorporated_AND_merlin(-1,-1)).

generate_facts_scooby_doo__mystery_incorporated_AND_merlin([(Start,End) | Tail]) :- assert(scooby_doo__mystery_incorporated_AND_merlin(Start,End)), generate_facts_scooby_doo__mystery_incorporated_AND_merlin(Tail).

scooby_doo__mystery_incorporated_AND_merlin_aux() :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval1), findall((Start,End),merlin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scooby_doo__mystery_incorporated_AND_merlin(Interval).

scooby_doo__mystery_incorporated_AND_merlin_at_2004(Res) :- setof((Start,End),scooby_doo__mystery_incorporated_AND_merlin(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = scooby_doo__mystery_incorporated_AND_merlin_at_2004'), (scooby_doo__mystery_incorporated_AND_merlin_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scooby_doo__mystery_incorporated_AND_merlin_aux().

