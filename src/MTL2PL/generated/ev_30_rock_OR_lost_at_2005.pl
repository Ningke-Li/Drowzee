:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

lost(Start,End) :- begin('lost',_,_,Start), end('lost',_,_,End), Start=<End.

generate_facts_ev_30_rock_OR_lost([]) :- assert(ev_30_rock_OR_lost(-1,-1)).

generate_facts_ev_30_rock_OR_lost([(Start,End) | Tail]) :- assert(ev_30_rock_OR_lost(Start,End)), generate_facts_ev_30_rock_OR_lost(Tail).

ev_30_rock_OR_lost_aux() :- findall((Start,End),ev_30_rock(Start,End),Interval1), findall((Start,End),lost(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_30_rock_OR_lost(Interval).

ev_30_rock_OR_lost_at_2005(Res) :- setof((Start,End),ev_30_rock_OR_lost(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = ev_30_rock_OR_lost_at_2005'), (ev_30_rock_OR_lost_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_30_rock_OR_lost_aux().

