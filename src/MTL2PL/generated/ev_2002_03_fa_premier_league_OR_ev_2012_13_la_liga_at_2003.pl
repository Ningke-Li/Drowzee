:- include('database.pl').
ev_2002_03_fa_premier_league(Start,End) :- begin('ev_2002_03_fa_premier_league',_,_,Start), end('ev_2002_03_fa_premier_league',_,_,End), Start=<End.

ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

generate_facts_ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga([]) :- assert(ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga(-1,-1)).

generate_facts_ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga([(Start,End) | Tail]) :- assert(ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga(Start,End)), generate_facts_ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga(Tail).

ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga_aux() :- findall((Start,End),ev_2002_03_fa_premier_league(Start,End),Interval1), findall((Start,End),ev_2012_13_la_liga(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga(Interval).

ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga_at_2003(Res) :- setof((Start,End),ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga_at_2003'), (ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_03_fa_premier_league_OR_ev_2012_13_la_liga_aux().

