:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

generate_facts_veep_AND_ev_2016_17_serie_a([]) :- assert(veep_AND_ev_2016_17_serie_a(-1,-1)).

generate_facts_veep_AND_ev_2016_17_serie_a([(Start,End) | Tail]) :- assert(veep_AND_ev_2016_17_serie_a(Start,End)), generate_facts_veep_AND_ev_2016_17_serie_a(Tail).

veep_AND_ev_2016_17_serie_a_aux() :- findall((Start,End),veep(Start,End),Interval1), findall((Start,End),ev_2016_17_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_veep_AND_ev_2016_17_serie_a(Interval).

veep_AND_ev_2016_17_serie_a_at_1876(Res) :- setof((Start,End),veep_AND_ev_2016_17_serie_a(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = veep_AND_ev_2016_17_serie_a_at_1876'), (veep_AND_ev_2016_17_serie_a_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).
?- veep_AND_ev_2016_17_serie_a_aux().

