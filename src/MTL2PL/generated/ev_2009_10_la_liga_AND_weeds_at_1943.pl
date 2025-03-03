:- include('database.pl').
ev_2009_10_la_liga(Start,End) :- begin('ev_2009_10_la_liga',_,_,Start), end('ev_2009_10_la_liga',_,_,End), Start=<End.

weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

generate_facts_ev_2009_10_la_liga_AND_weeds([]) :- assert(ev_2009_10_la_liga_AND_weeds(-1,-1)).

generate_facts_ev_2009_10_la_liga_AND_weeds([(Start,End) | Tail]) :- assert(ev_2009_10_la_liga_AND_weeds(Start,End)), generate_facts_ev_2009_10_la_liga_AND_weeds(Tail).

ev_2009_10_la_liga_AND_weeds_aux() :- findall((Start,End),ev_2009_10_la_liga(Start,End),Interval1), findall((Start,End),weeds(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2009_10_la_liga_AND_weeds(Interval).

ev_2009_10_la_liga_AND_weeds_at_1943(Res) :- setof((Start,End),ev_2009_10_la_liga_AND_weeds(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = ev_2009_10_la_liga_AND_weeds_at_1943'), (ev_2009_10_la_liga_AND_weeds_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_10_la_liga_AND_weeds_aux().

