:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

generate_facts_phineas_and_ferb_AND_sofia_the_first([]) :- assert(phineas_and_ferb_AND_sofia_the_first(-1,-1)).

generate_facts_phineas_and_ferb_AND_sofia_the_first([(Start,End) | Tail]) :- assert(phineas_and_ferb_AND_sofia_the_first(Start,End)), generate_facts_phineas_and_ferb_AND_sofia_the_first(Tail).

phineas_and_ferb_AND_sofia_the_first_aux() :- findall((Start,End),phineas_and_ferb(Start,End),Interval1), findall((Start,End),sofia_the_first(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phineas_and_ferb_AND_sofia_the_first(Interval).

phineas_and_ferb_AND_sofia_the_first_at_1862(Res) :- setof((Start,End),phineas_and_ferb_AND_sofia_the_first(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = phineas_and_ferb_AND_sofia_the_first_at_1862'), (phineas_and_ferb_AND_sofia_the_first_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phineas_and_ferb_AND_sofia_the_first_aux().

