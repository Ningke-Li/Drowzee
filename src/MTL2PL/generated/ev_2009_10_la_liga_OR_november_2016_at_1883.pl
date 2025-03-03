:- include('database.pl').
ev_2009_10_la_liga(Start,End) :- begin('ev_2009_10_la_liga',_,_,Start), end('ev_2009_10_la_liga',_,_,End), Start=<End.

november_2016(Start,End) :- begin('november_2016',_,_,Start), end('november_2016',_,_,End), Start=<End.

generate_facts_ev_2009_10_la_liga_OR_november_2016([]) :- assert(ev_2009_10_la_liga_OR_november_2016(-1,-1)).

generate_facts_ev_2009_10_la_liga_OR_november_2016([(Start,End) | Tail]) :- assert(ev_2009_10_la_liga_OR_november_2016(Start,End)), generate_facts_ev_2009_10_la_liga_OR_november_2016(Tail).

ev_2009_10_la_liga_OR_november_2016_aux() :- findall((Start,End),ev_2009_10_la_liga(Start,End),Interval1), findall((Start,End),november_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_10_la_liga_OR_november_2016(Interval).

ev_2009_10_la_liga_OR_november_2016_at_1883(Res) :- setof((Start,End),ev_2009_10_la_liga_OR_november_2016(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = ev_2009_10_la_liga_OR_november_2016_at_1883'), (ev_2009_10_la_liga_OR_november_2016_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_10_la_liga_OR_november_2016_aux().

