:- include('database.pl').
ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

generate_facts_ev_2012_13_la_liga_OR_westworld([]) :- assert(ev_2012_13_la_liga_OR_westworld(-1,-1)).

generate_facts_ev_2012_13_la_liga_OR_westworld([(Start,End) | Tail]) :- assert(ev_2012_13_la_liga_OR_westworld(Start,End)), generate_facts_ev_2012_13_la_liga_OR_westworld(Tail).

ev_2012_13_la_liga_OR_westworld_aux() :- findall((Start,End),ev_2012_13_la_liga(Start,End),Interval1), findall((Start,End),westworld(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_la_liga_OR_westworld(Interval).

ev_2012_13_la_liga_OR_westworld_at_2018(Res) :- setof((Start,End),ev_2012_13_la_liga_OR_westworld(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_la_liga_OR_westworld_at_2018'), (ev_2012_13_la_liga_OR_westworld_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_la_liga_OR_westworld_aux().

