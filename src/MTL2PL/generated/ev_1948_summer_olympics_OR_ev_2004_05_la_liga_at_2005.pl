:- include('database.pl').
ev_1948_summer_olympics(Start,End) :- begin('ev_1948_summer_olympics',_,_,Start), end('ev_1948_summer_olympics',_,_,End), Start=<End.

ev_2004_05_la_liga(Start,End) :- begin('ev_2004_05_la_liga',_,_,Start), end('ev_2004_05_la_liga',_,_,End), Start=<End.

generate_facts_ev_1948_summer_olympics_OR_ev_2004_05_la_liga([]) :- assert(ev_1948_summer_olympics_OR_ev_2004_05_la_liga(-1,-1)).

generate_facts_ev_1948_summer_olympics_OR_ev_2004_05_la_liga([(Start,End) | Tail]) :- assert(ev_1948_summer_olympics_OR_ev_2004_05_la_liga(Start,End)), generate_facts_ev_1948_summer_olympics_OR_ev_2004_05_la_liga(Tail).

ev_1948_summer_olympics_OR_ev_2004_05_la_liga_aux() :- findall((Start,End),ev_1948_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2004_05_la_liga(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1948_summer_olympics_OR_ev_2004_05_la_liga(Interval).

ev_1948_summer_olympics_OR_ev_2004_05_la_liga_at_2005(Res) :- setof((Start,End),ev_1948_summer_olympics_OR_ev_2004_05_la_liga(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = ev_1948_summer_olympics_OR_ev_2004_05_la_liga_at_2005'), (ev_1948_summer_olympics_OR_ev_2004_05_la_liga_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1948_summer_olympics_OR_ev_2004_05_la_liga_aux().

