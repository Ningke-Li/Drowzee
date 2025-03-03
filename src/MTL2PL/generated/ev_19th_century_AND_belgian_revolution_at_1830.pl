:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

belgian_revolution(Start,End) :- begin('belgian_revolution',_,_,Start), end('belgian_revolution',_,_,End), Start=<End.

generate_facts_ev_19th_century_AND_belgian_revolution([]) :- assert(ev_19th_century_AND_belgian_revolution(-1,-1)).

generate_facts_ev_19th_century_AND_belgian_revolution([(Start,End) | Tail]) :- assert(ev_19th_century_AND_belgian_revolution(Start,End)), generate_facts_ev_19th_century_AND_belgian_revolution(Tail).

ev_19th_century_AND_belgian_revolution_aux() :- findall((Start,End),ev_19th_century(Start,End),Interval1), findall((Start,End),belgian_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_19th_century_AND_belgian_revolution(Interval).

ev_19th_century_AND_belgian_revolution_at_1830(Res) :- setof((Start,End),ev_19th_century_AND_belgian_revolution(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = ev_19th_century_AND_belgian_revolution_at_1830'), (ev_19th_century_AND_belgian_revolution_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_19th_century_AND_belgian_revolution_aux().

