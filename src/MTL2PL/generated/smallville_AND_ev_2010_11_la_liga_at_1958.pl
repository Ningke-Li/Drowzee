:- include('database.pl').
smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

generate_facts_smallville_AND_ev_2010_11_la_liga([]) :- assert(smallville_AND_ev_2010_11_la_liga(-1,-1)).

generate_facts_smallville_AND_ev_2010_11_la_liga([(Start,End) | Tail]) :- assert(smallville_AND_ev_2010_11_la_liga(Start,End)), generate_facts_smallville_AND_ev_2010_11_la_liga(Tail).

smallville_AND_ev_2010_11_la_liga_aux() :- findall((Start,End),smallville(Start,End),Interval1), findall((Start,End),ev_2010_11_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_smallville_AND_ev_2010_11_la_liga(Interval).

smallville_AND_ev_2010_11_la_liga_at_1958(Res) :- setof((Start,End),smallville_AND_ev_2010_11_la_liga(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = smallville_AND_ev_2010_11_la_liga_at_1958'), (smallville_AND_ev_2010_11_la_liga_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).
?- smallville_AND_ev_2010_11_la_liga_aux().

