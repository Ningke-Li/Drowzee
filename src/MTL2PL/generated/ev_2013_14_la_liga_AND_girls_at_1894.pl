:- include('database.pl').
ev_2013_14_la_liga(Start,End) :- begin('ev_2013_14_la_liga',_,_,Start), end('ev_2013_14_la_liga',_,_,End), Start=<End.

girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

generate_facts_ev_2013_14_la_liga_AND_girls([]) :- assert(ev_2013_14_la_liga_AND_girls(-1,-1)).

generate_facts_ev_2013_14_la_liga_AND_girls([(Start,End) | Tail]) :- assert(ev_2013_14_la_liga_AND_girls(Start,End)), generate_facts_ev_2013_14_la_liga_AND_girls(Tail).

ev_2013_14_la_liga_AND_girls_aux() :- findall((Start,End),ev_2013_14_la_liga(Start,End),Interval1), findall((Start,End),girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_la_liga_AND_girls(Interval).

ev_2013_14_la_liga_AND_girls_at_1894(Res) :- setof((Start,End),ev_2013_14_la_liga_AND_girls(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_la_liga_AND_girls_at_1894'), (ev_2013_14_la_liga_AND_girls_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_la_liga_AND_girls_aux().

