:- include('database.pl').
ev_2011_12_la_liga(Start,End) :- begin('ev_2011_12_la_liga',_,_,Start), end('ev_2011_12_la_liga',_,_,End), Start=<End.

castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

generate_facts_ev_2011_12_la_liga_AND_castle([]) :- assert(ev_2011_12_la_liga_AND_castle(-1,-1)).

generate_facts_ev_2011_12_la_liga_AND_castle([(Start,End) | Tail]) :- assert(ev_2011_12_la_liga_AND_castle(Start,End)), generate_facts_ev_2011_12_la_liga_AND_castle(Tail).

ev_2011_12_la_liga_AND_castle_aux() :- findall((Start,End),ev_2011_12_la_liga(Start,End),Interval1), findall((Start,End),castle(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2011_12_la_liga_AND_castle(Interval).

ev_2011_12_la_liga_AND_castle_at_2012(Res) :- setof((Start,End),ev_2011_12_la_liga_AND_castle(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_2011_12_la_liga_AND_castle_at_2012'), (ev_2011_12_la_liga_AND_castle_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_12_la_liga_AND_castle_aux().

