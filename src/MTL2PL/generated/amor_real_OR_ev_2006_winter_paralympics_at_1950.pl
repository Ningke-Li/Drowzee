:- include('database.pl').
amor_real(Start,End) :- begin('amor_real',_,_,Start), end('amor_real',_,_,End), Start=<End.

ev_2006_winter_paralympics(Start,End) :- begin('ev_2006_winter_paralympics',_,_,Start), end('ev_2006_winter_paralympics',_,_,End), Start=<End.

generate_facts_amor_real_OR_ev_2006_winter_paralympics([]) :- assert(amor_real_OR_ev_2006_winter_paralympics(-1,-1)).

generate_facts_amor_real_OR_ev_2006_winter_paralympics([(Start,End) | Tail]) :- assert(amor_real_OR_ev_2006_winter_paralympics(Start,End)), generate_facts_amor_real_OR_ev_2006_winter_paralympics(Tail).

amor_real_OR_ev_2006_winter_paralympics_aux() :- findall((Start,End),amor_real(Start,End),Interval1), findall((Start,End),ev_2006_winter_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_amor_real_OR_ev_2006_winter_paralympics(Interval).

amor_real_OR_ev_2006_winter_paralympics_at_1950(Res) :- setof((Start,End),amor_real_OR_ev_2006_winter_paralympics(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = amor_real_OR_ev_2006_winter_paralympics_at_1950'), (amor_real_OR_ev_2006_winter_paralympics_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).
?- amor_real_OR_ev_2006_winter_paralympics_aux().

