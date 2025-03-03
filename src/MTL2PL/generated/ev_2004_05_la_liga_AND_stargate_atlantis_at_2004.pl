:- include('database.pl').
ev_2004_05_la_liga(Start,End) :- begin('ev_2004_05_la_liga',_,_,Start), end('ev_2004_05_la_liga',_,_,End), Start=<End.

stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

generate_facts_ev_2004_05_la_liga_AND_stargate_atlantis([]) :- assert(ev_2004_05_la_liga_AND_stargate_atlantis(-1,-1)).

generate_facts_ev_2004_05_la_liga_AND_stargate_atlantis([(Start,End) | Tail]) :- assert(ev_2004_05_la_liga_AND_stargate_atlantis(Start,End)), generate_facts_ev_2004_05_la_liga_AND_stargate_atlantis(Tail).

ev_2004_05_la_liga_AND_stargate_atlantis_aux() :- findall((Start,End),ev_2004_05_la_liga(Start,End),Interval1), findall((Start,End),stargate_atlantis(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2004_05_la_liga_AND_stargate_atlantis(Interval).

ev_2004_05_la_liga_AND_stargate_atlantis_at_2004(Res) :- setof((Start,End),ev_2004_05_la_liga_AND_stargate_atlantis(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = ev_2004_05_la_liga_AND_stargate_atlantis_at_2004'), (ev_2004_05_la_liga_AND_stargate_atlantis_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_05_la_liga_AND_stargate_atlantis_aux().

