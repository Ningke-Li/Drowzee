:- include('database.pl').
ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

generate_facts_ev_2013_14_serie_a_OR_ev_2012_13_premier_league([]) :- assert(ev_2013_14_serie_a_OR_ev_2012_13_premier_league(-1,-1)).

generate_facts_ev_2013_14_serie_a_OR_ev_2012_13_premier_league([(Start,End) | Tail]) :- assert(ev_2013_14_serie_a_OR_ev_2012_13_premier_league(Start,End)), generate_facts_ev_2013_14_serie_a_OR_ev_2012_13_premier_league(Tail).

ev_2013_14_serie_a_OR_ev_2012_13_premier_league_aux() :- findall((Start,End),ev_2013_14_serie_a(Start,End),Interval1), findall((Start,End),ev_2012_13_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_14_serie_a_OR_ev_2012_13_premier_league(Interval).

ev_2013_14_serie_a_OR_ev_2012_13_premier_league_at_2014(Res) :- setof((Start,End),ev_2013_14_serie_a_OR_ev_2012_13_premier_league(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_serie_a_OR_ev_2012_13_premier_league_at_2014'), (ev_2013_14_serie_a_OR_ev_2012_13_premier_league_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_serie_a_OR_ev_2012_13_premier_league_aux().

