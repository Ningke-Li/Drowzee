:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

generate_facts_phineas_and_ferb_AND_lithuanian_litas([]) :- assert(phineas_and_ferb_AND_lithuanian_litas(-1,-1)).

generate_facts_phineas_and_ferb_AND_lithuanian_litas([(Start,End) | Tail]) :- assert(phineas_and_ferb_AND_lithuanian_litas(Start,End)), generate_facts_phineas_and_ferb_AND_lithuanian_litas(Tail).

phineas_and_ferb_AND_lithuanian_litas_aux() :- findall((Start,End),phineas_and_ferb(Start,End),Interval1), findall((Start,End),lithuanian_litas(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phineas_and_ferb_AND_lithuanian_litas(Interval).

phineas_and_ferb_AND_lithuanian_litas_at_1873(Res) :- setof((Start,End),phineas_and_ferb_AND_lithuanian_litas(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = phineas_and_ferb_AND_lithuanian_litas_at_1873'), (phineas_and_ferb_AND_lithuanian_litas_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phineas_and_ferb_AND_lithuanian_litas_aux().

