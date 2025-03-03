:- include('database.pl').
osiris_rex(Start,End) :- begin('osiris_rex',_,_,Start), end('osiris_rex',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

generate_facts_osiris_rex_OR_ncis__los_angeles([]) :- assert(osiris_rex_OR_ncis__los_angeles(-1,-1)).

generate_facts_osiris_rex_OR_ncis__los_angeles([(Start,End) | Tail]) :- assert(osiris_rex_OR_ncis__los_angeles(Start,End)), generate_facts_osiris_rex_OR_ncis__los_angeles(Tail).

osiris_rex_OR_ncis__los_angeles_aux() :- findall((Start,End),osiris_rex(Start,End),Interval1), findall((Start,End),ncis__los_angeles(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_osiris_rex_OR_ncis__los_angeles(Interval).

osiris_rex_OR_ncis__los_angeles_at_2046(Res) :- setof((Start,End),osiris_rex_OR_ncis__los_angeles(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = osiris_rex_OR_ncis__los_angeles_at_2046'), (osiris_rex_OR_ncis__los_angeles_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).
?- osiris_rex_OR_ncis__los_angeles_aux().

