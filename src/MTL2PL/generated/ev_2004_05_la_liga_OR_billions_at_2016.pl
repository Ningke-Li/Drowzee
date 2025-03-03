:- include('database.pl').
ev_2004_05_la_liga(Start,End) :- begin('ev_2004_05_la_liga',_,_,Start), end('ev_2004_05_la_liga',_,_,End), Start=<End.

billions(Start,End) :- begin('billions',_,_,Start), end('billions',_,_,End), Start=<End.

generate_facts_ev_2004_05_la_liga_OR_billions([]) :- assert(ev_2004_05_la_liga_OR_billions(-1,-1)).

generate_facts_ev_2004_05_la_liga_OR_billions([(Start,End) | Tail]) :- assert(ev_2004_05_la_liga_OR_billions(Start,End)), generate_facts_ev_2004_05_la_liga_OR_billions(Tail).

ev_2004_05_la_liga_OR_billions_aux() :- findall((Start,End),ev_2004_05_la_liga(Start,End),Interval1), findall((Start,End),billions(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2004_05_la_liga_OR_billions(Interval).

ev_2004_05_la_liga_OR_billions_at_2016(Res) :- setof((Start,End),ev_2004_05_la_liga_OR_billions(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_2004_05_la_liga_OR_billions_at_2016'), (ev_2004_05_la_liga_OR_billions_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_05_la_liga_OR_billions_aux().

