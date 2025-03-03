:- include('database.pl').
ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

generate_facts_ev_2010_11_la_liga_AND_csi__ny([]) :- assert(ev_2010_11_la_liga_AND_csi__ny(-1,-1)).

generate_facts_ev_2010_11_la_liga_AND_csi__ny([(Start,End) | Tail]) :- assert(ev_2010_11_la_liga_AND_csi__ny(Start,End)), generate_facts_ev_2010_11_la_liga_AND_csi__ny(Tail).

ev_2010_11_la_liga_AND_csi__ny_aux() :- findall((Start,End),ev_2010_11_la_liga(Start,End),Interval1), findall((Start,End),csi__ny(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010_11_la_liga_AND_csi__ny(Interval).

ev_2010_11_la_liga_AND_csi__ny_at_2011(Res) :- setof((Start,End),ev_2010_11_la_liga_AND_csi__ny(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_2010_11_la_liga_AND_csi__ny_at_2011'), (ev_2010_11_la_liga_AND_csi__ny_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_11_la_liga_AND_csi__ny_aux().

