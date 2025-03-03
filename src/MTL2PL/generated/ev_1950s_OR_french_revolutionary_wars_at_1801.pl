:- include('database.pl').
ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

generate_facts_ev_1950s_OR_french_revolutionary_wars([]) :- assert(ev_1950s_OR_french_revolutionary_wars(-1,-1)).

generate_facts_ev_1950s_OR_french_revolutionary_wars([(Start,End) | Tail]) :- assert(ev_1950s_OR_french_revolutionary_wars(Start,End)), generate_facts_ev_1950s_OR_french_revolutionary_wars(Tail).

ev_1950s_OR_french_revolutionary_wars_aux() :- findall((Start,End),ev_1950s(Start,End),Interval1), findall((Start,End),french_revolutionary_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1950s_OR_french_revolutionary_wars(Interval).

ev_1950s_OR_french_revolutionary_wars_at_1801(Res) :- setof((Start,End),ev_1950s_OR_french_revolutionary_wars(Start,End),AllINtervals), checkvalidity(1801,AllINtervals,Res).

check_query() :- write('Query = ev_1950s_OR_french_revolutionary_wars_at_1801'), (ev_1950s_OR_french_revolutionary_wars_at_1801(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1950s_OR_french_revolutionary_wars_aux().

