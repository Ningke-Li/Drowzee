:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

texas_revoluci_n(Start,End) :- begin('texas_revoluci_n',_,_,Start), end('texas_revoluci_n',_,_,End), Start=<End.

generate_facts_ev_19th_century_AND_texas_revoluci_n([]) :- assert(ev_19th_century_AND_texas_revoluci_n(-1,-1)).

generate_facts_ev_19th_century_AND_texas_revoluci_n([(Start,End) | Tail]) :- assert(ev_19th_century_AND_texas_revoluci_n(Start,End)), generate_facts_ev_19th_century_AND_texas_revoluci_n(Tail).

ev_19th_century_AND_texas_revoluci_n_aux() :- findall((Start,End),ev_19th_century(Start,End),Interval1), findall((Start,End),texas_revoluci_n(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_19th_century_AND_texas_revoluci_n(Interval).

ev_19th_century_AND_texas_revoluci_n_at_1836(Res) :- setof((Start,End),ev_19th_century_AND_texas_revoluci_n(Start,End),AllINtervals), checkvalidity(1836,AllINtervals,Res).

check_query() :- write('Query = ev_19th_century_AND_texas_revoluci_n_at_1836'), (ev_19th_century_AND_texas_revoluci_n_at_1836(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_19th_century_AND_texas_revoluci_n_aux().

