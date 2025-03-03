:- include('database.pl').
ev_18th_century(Start,End) :- begin('ev_18th_century',_,_,Start), end('ev_18th_century',_,_,End), Start=<End.

quasi_war(Start,End) :- begin('quasi_war',_,_,Start), end('quasi_war',_,_,End), Start=<End.

generate_facts_ev_18th_century_AND_quasi_war([]) :- assert(ev_18th_century_AND_quasi_war(-1,-1)).

generate_facts_ev_18th_century_AND_quasi_war([(Start,End) | Tail]) :- assert(ev_18th_century_AND_quasi_war(Start,End)), generate_facts_ev_18th_century_AND_quasi_war(Tail).

ev_18th_century_AND_quasi_war_aux() :- findall((Start,End),ev_18th_century(Start,End),Interval1), findall((Start,End),quasi_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_18th_century_AND_quasi_war(Interval).

ev_18th_century_AND_quasi_war_at_1798(Res) :- setof((Start,End),ev_18th_century_AND_quasi_war(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = ev_18th_century_AND_quasi_war_at_1798'), (ev_18th_century_AND_quasi_war_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_18th_century_AND_quasi_war_aux().

