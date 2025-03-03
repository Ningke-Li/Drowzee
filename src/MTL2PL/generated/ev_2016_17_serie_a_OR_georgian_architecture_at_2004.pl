:- include('database.pl').
ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

generate_facts_ev_2016_17_serie_a_OR_georgian_architecture([]) :- assert(ev_2016_17_serie_a_OR_georgian_architecture(-1,-1)).

generate_facts_ev_2016_17_serie_a_OR_georgian_architecture([(Start,End) | Tail]) :- assert(ev_2016_17_serie_a_OR_georgian_architecture(Start,End)), generate_facts_ev_2016_17_serie_a_OR_georgian_architecture(Tail).

ev_2016_17_serie_a_OR_georgian_architecture_aux() :- findall((Start,End),ev_2016_17_serie_a(Start,End),Interval1), findall((Start,End),georgian_architecture(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2016_17_serie_a_OR_georgian_architecture(Interval).

ev_2016_17_serie_a_OR_georgian_architecture_at_2004(Res) :- setof((Start,End),ev_2016_17_serie_a_OR_georgian_architecture(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = ev_2016_17_serie_a_OR_georgian_architecture_at_2004'), (ev_2016_17_serie_a_OR_georgian_architecture_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2016_17_serie_a_OR_georgian_architecture_aux().

