:- include('database.pl').
ev_1930s(Start,End) :- begin('ev_1930s',_,_,Start), end('ev_1930s',_,_,End), Start=<End.

ev_1720s(Start,End) :- begin('ev_1720s',_,_,Start), end('ev_1720s',_,_,End), Start=<End.

generate_facts_ev_1930s_OR_ev_1720s([]) :- assert(ev_1930s_OR_ev_1720s(-1,-1)).

generate_facts_ev_1930s_OR_ev_1720s([(Start,End) | Tail]) :- assert(ev_1930s_OR_ev_1720s(Start,End)), generate_facts_ev_1930s_OR_ev_1720s(Tail).

ev_1930s_OR_ev_1720s_aux() :- findall((Start,End),ev_1930s(Start,End),Interval1), findall((Start,End),ev_1720s(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1930s_OR_ev_1720s(Interval).

ev_1930s_OR_ev_1720s_at_1728(Res) :- setof((Start,End),ev_1930s_OR_ev_1720s(Start,End),AllINtervals), checkvalidity(1728,AllINtervals,Res).

check_query() :- write('Query = ev_1930s_OR_ev_1720s_at_1728'), (ev_1930s_OR_ev_1720s_at_1728(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1930s_OR_ev_1720s_aux().

