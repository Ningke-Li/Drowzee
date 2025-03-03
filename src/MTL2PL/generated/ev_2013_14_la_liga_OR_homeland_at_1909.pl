:- include('database.pl').
ev_2013_14_la_liga(Start,End) :- begin('ev_2013_14_la_liga',_,_,Start), end('ev_2013_14_la_liga',_,_,End), Start=<End.

homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

generate_facts_ev_2013_14_la_liga_OR_homeland([]) :- assert(ev_2013_14_la_liga_OR_homeland(-1,-1)).

generate_facts_ev_2013_14_la_liga_OR_homeland([(Start,End) | Tail]) :- assert(ev_2013_14_la_liga_OR_homeland(Start,End)), generate_facts_ev_2013_14_la_liga_OR_homeland(Tail).

ev_2013_14_la_liga_OR_homeland_aux() :- findall((Start,End),ev_2013_14_la_liga(Start,End),Interval1), findall((Start,End),homeland(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_14_la_liga_OR_homeland(Interval).

ev_2013_14_la_liga_OR_homeland_at_1909(Res) :- setof((Start,End),ev_2013_14_la_liga_OR_homeland(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_la_liga_OR_homeland_at_1909'), (ev_2013_14_la_liga_OR_homeland_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_la_liga_OR_homeland_aux().

