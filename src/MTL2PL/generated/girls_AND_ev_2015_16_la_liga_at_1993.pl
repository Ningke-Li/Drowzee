:- include('database.pl').
girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

generate_facts_girls_AND_ev_2015_16_la_liga([]) :- assert(girls_AND_ev_2015_16_la_liga(-1,-1)).

generate_facts_girls_AND_ev_2015_16_la_liga([(Start,End) | Tail]) :- assert(girls_AND_ev_2015_16_la_liga(Start,End)), generate_facts_girls_AND_ev_2015_16_la_liga(Tail).

girls_AND_ev_2015_16_la_liga_aux() :- findall((Start,End),girls(Start,End),Interval1), findall((Start,End),ev_2015_16_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_girls_AND_ev_2015_16_la_liga(Interval).

girls_AND_ev_2015_16_la_liga_at_1993(Res) :- setof((Start,End),girls_AND_ev_2015_16_la_liga(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = girls_AND_ev_2015_16_la_liga_at_1993'), (girls_AND_ev_2015_16_la_liga_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).
?- girls_AND_ev_2015_16_la_liga_aux().

