:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

generate_facts_ev_2010s_AND_lithuanian_litas([]) :- assert(ev_2010s_AND_lithuanian_litas(-1,-1)).

generate_facts_ev_2010s_AND_lithuanian_litas([(Start,End) | Tail]) :- assert(ev_2010s_AND_lithuanian_litas(Start,End)), generate_facts_ev_2010s_AND_lithuanian_litas(Tail).

ev_2010s_AND_lithuanian_litas_aux() :- findall((Start,End),ev_2010s(Start,End),Interval1), findall((Start,End),lithuanian_litas(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010s_AND_lithuanian_litas(Interval).

ev_2010s_AND_lithuanian_litas_at_1873(Res) :- setof((Start,End),ev_2010s_AND_lithuanian_litas(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = ev_2010s_AND_lithuanian_litas_at_1873'), (ev_2010s_AND_lithuanian_litas_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010s_AND_lithuanian_litas_aux().

