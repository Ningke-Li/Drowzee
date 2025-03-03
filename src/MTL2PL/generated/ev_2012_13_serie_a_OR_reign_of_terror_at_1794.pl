:- include('database.pl').
ev_2012_13_serie_a(Start,End) :- begin('ev_2012_13_serie_a',_,_,Start), end('ev_2012_13_serie_a',_,_,End), Start=<End.

reign_of_terror(Start,End) :- begin('reign_of_terror',_,_,Start), end('reign_of_terror',_,_,End), Start=<End.

generate_facts_ev_2012_13_serie_a_OR_reign_of_terror([]) :- assert(ev_2012_13_serie_a_OR_reign_of_terror(-1,-1)).

generate_facts_ev_2012_13_serie_a_OR_reign_of_terror([(Start,End) | Tail]) :- assert(ev_2012_13_serie_a_OR_reign_of_terror(Start,End)), generate_facts_ev_2012_13_serie_a_OR_reign_of_terror(Tail).

ev_2012_13_serie_a_OR_reign_of_terror_aux() :- findall((Start,End),ev_2012_13_serie_a(Start,End),Interval1), findall((Start,End),reign_of_terror(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_serie_a_OR_reign_of_terror(Interval).

ev_2012_13_serie_a_OR_reign_of_terror_at_1794(Res) :- setof((Start,End),ev_2012_13_serie_a_OR_reign_of_terror(Start,End),AllINtervals), checkvalidity(1794,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_serie_a_OR_reign_of_terror_at_1794'), (ev_2012_13_serie_a_OR_reign_of_terror_at_1794(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_serie_a_OR_reign_of_terror_aux().

