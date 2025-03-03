:- include('database.pl').
the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

generate_facts_the_tudors_AND_phineas_and_ferb([]) :- assert(the_tudors_AND_phineas_and_ferb(-1,-1)).

generate_facts_the_tudors_AND_phineas_and_ferb([(Start,End) | Tail]) :- assert(the_tudors_AND_phineas_and_ferb(Start,End)), generate_facts_the_tudors_AND_phineas_and_ferb(Tail).

the_tudors_AND_phineas_and_ferb_aux() :- findall((Start,End),the_tudors(Start,End),Interval1), findall((Start,End),phineas_and_ferb(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_tudors_AND_phineas_and_ferb(Interval).

the_tudors_AND_phineas_and_ferb_at_1944(Res) :- setof((Start,End),the_tudors_AND_phineas_and_ferb(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = the_tudors_AND_phineas_and_ferb_at_1944'), (the_tudors_AND_phineas_and_ferb_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_tudors_AND_phineas_and_ferb_aux().

