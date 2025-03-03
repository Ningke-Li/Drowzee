:- include('database.pl').
breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

ev_2011_12_la_liga(Start,End) :- begin('ev_2011_12_la_liga',_,_,Start), end('ev_2011_12_la_liga',_,_,End), Start=<End.

generate_facts_breaking_bad_AND_ev_2011_12_la_liga([]) :- assert(breaking_bad_AND_ev_2011_12_la_liga(-1,-1)).

generate_facts_breaking_bad_AND_ev_2011_12_la_liga([(Start,End) | Tail]) :- assert(breaking_bad_AND_ev_2011_12_la_liga(Start,End)), generate_facts_breaking_bad_AND_ev_2011_12_la_liga(Tail).

breaking_bad_AND_ev_2011_12_la_liga_aux() :- findall((Start,End),breaking_bad(Start,End),Interval1), findall((Start,End),ev_2011_12_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_breaking_bad_AND_ev_2011_12_la_liga(Interval).

breaking_bad_AND_ev_2011_12_la_liga_at_1951(Res) :- setof((Start,End),breaking_bad_AND_ev_2011_12_la_liga(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = breaking_bad_AND_ev_2011_12_la_liga_at_1951'), (breaking_bad_AND_ev_2011_12_la_liga_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).
?- breaking_bad_AND_ev_2011_12_la_liga_aux().

