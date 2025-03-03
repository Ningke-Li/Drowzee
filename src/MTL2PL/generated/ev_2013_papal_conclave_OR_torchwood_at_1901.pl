:- include('database.pl').
ev_2013_papal_conclave(Start,End) :- begin('ev_2013_papal_conclave',_,_,Start), end('ev_2013_papal_conclave',_,_,End), Start=<End.

torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

generate_facts_ev_2013_papal_conclave_OR_torchwood([]) :- assert(ev_2013_papal_conclave_OR_torchwood(-1,-1)).

generate_facts_ev_2013_papal_conclave_OR_torchwood([(Start,End) | Tail]) :- assert(ev_2013_papal_conclave_OR_torchwood(Start,End)), generate_facts_ev_2013_papal_conclave_OR_torchwood(Tail).

ev_2013_papal_conclave_OR_torchwood_aux() :- findall((Start,End),ev_2013_papal_conclave(Start,End),Interval1), findall((Start,End),torchwood(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_papal_conclave_OR_torchwood(Interval).

ev_2013_papal_conclave_OR_torchwood_at_1901(Res) :- setof((Start,End),ev_2013_papal_conclave_OR_torchwood(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = ev_2013_papal_conclave_OR_torchwood_at_1901'), (ev_2013_papal_conclave_OR_torchwood_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_papal_conclave_OR_torchwood_aux().

