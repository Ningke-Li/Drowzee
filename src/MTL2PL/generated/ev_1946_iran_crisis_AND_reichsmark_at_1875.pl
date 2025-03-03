:- include('database.pl').
ev_1946_iran_crisis(Start,End) :- begin('ev_1946_iran_crisis',_,_,Start), end('ev_1946_iran_crisis',_,_,End), Start=<End.

reichsmark(Start,End) :- begin('reichsmark',_,_,Start), end('reichsmark',_,_,End), Start=<End.

generate_facts_ev_1946_iran_crisis_AND_reichsmark([]) :- assert(ev_1946_iran_crisis_AND_reichsmark(-1,-1)).

generate_facts_ev_1946_iran_crisis_AND_reichsmark([(Start,End) | Tail]) :- assert(ev_1946_iran_crisis_AND_reichsmark(Start,End)), generate_facts_ev_1946_iran_crisis_AND_reichsmark(Tail).

ev_1946_iran_crisis_AND_reichsmark_aux() :- findall((Start,End),ev_1946_iran_crisis(Start,End),Interval1), findall((Start,End),reichsmark(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1946_iran_crisis_AND_reichsmark(Interval).

ev_1946_iran_crisis_AND_reichsmark_at_1875(Res) :- setof((Start,End),ev_1946_iran_crisis_AND_reichsmark(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = ev_1946_iran_crisis_AND_reichsmark_at_1875'), (ev_1946_iran_crisis_AND_reichsmark_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1946_iran_crisis_AND_reichsmark_aux().

