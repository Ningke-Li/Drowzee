:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

generate_facts_ev_2010s_AND_the_mentalist([]) :- assert(ev_2010s_AND_the_mentalist(-1,-1)).

generate_facts_ev_2010s_AND_the_mentalist([(Start,End) | Tail]) :- assert(ev_2010s_AND_the_mentalist(Start,End)), generate_facts_ev_2010s_AND_the_mentalist(Tail).

ev_2010s_AND_the_mentalist_aux() :- findall((Start,End),ev_2010s(Start,End),Interval1), findall((Start,End),the_mentalist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010s_AND_the_mentalist(Interval).

ev_2010s_AND_the_mentalist_at_1935(Res) :- setof((Start,End),ev_2010s_AND_the_mentalist(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = ev_2010s_AND_the_mentalist_at_1935'), (ev_2010s_AND_the_mentalist_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010s_AND_the_mentalist_aux().

