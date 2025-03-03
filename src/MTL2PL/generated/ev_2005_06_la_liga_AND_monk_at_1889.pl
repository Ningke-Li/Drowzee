:- include('database.pl').
ev_2005_06_la_liga(Start,End) :- begin('ev_2005_06_la_liga',_,_,Start), end('ev_2005_06_la_liga',_,_,End), Start=<End.

monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

generate_facts_ev_2005_06_la_liga_AND_monk([]) :- assert(ev_2005_06_la_liga_AND_monk(-1,-1)).

generate_facts_ev_2005_06_la_liga_AND_monk([(Start,End) | Tail]) :- assert(ev_2005_06_la_liga_AND_monk(Start,End)), generate_facts_ev_2005_06_la_liga_AND_monk(Tail).

ev_2005_06_la_liga_AND_monk_aux() :- findall((Start,End),ev_2005_06_la_liga(Start,End),Interval1), findall((Start,End),monk(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2005_06_la_liga_AND_monk(Interval).

ev_2005_06_la_liga_AND_monk_at_1889(Res) :- setof((Start,End),ev_2005_06_la_liga_AND_monk(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_la_liga_AND_monk_at_1889'), (ev_2005_06_la_liga_AND_monk_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_la_liga_AND_monk_aux().

