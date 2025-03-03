:- include('database.pl').
ev_2005_06_la_liga(Start,End) :- begin('ev_2005_06_la_liga',_,_,Start), end('ev_2005_06_la_liga',_,_,End), Start=<End.

july_revolution(Start,End) :- begin('july_revolution',_,_,Start), end('july_revolution',_,_,End), Start=<End.

generate_facts_ev_2005_06_la_liga_OR_july_revolution([]) :- assert(ev_2005_06_la_liga_OR_july_revolution(-1,-1)).

generate_facts_ev_2005_06_la_liga_OR_july_revolution([(Start,End) | Tail]) :- assert(ev_2005_06_la_liga_OR_july_revolution(Start,End)), generate_facts_ev_2005_06_la_liga_OR_july_revolution(Tail).

ev_2005_06_la_liga_OR_july_revolution_aux() :- findall((Start,End),ev_2005_06_la_liga(Start,End),Interval1), findall((Start,End),july_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_06_la_liga_OR_july_revolution(Interval).

ev_2005_06_la_liga_OR_july_revolution_at_1948(Res) :- setof((Start,End),ev_2005_06_la_liga_OR_july_revolution(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_la_liga_OR_july_revolution_at_1948'), (ev_2005_06_la_liga_OR_july_revolution_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_la_liga_OR_july_revolution_aux().

