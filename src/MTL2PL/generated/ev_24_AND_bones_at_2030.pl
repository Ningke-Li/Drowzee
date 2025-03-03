:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

generate_facts_ev_24_AND_bones([]) :- assert(ev_24_AND_bones(-1,-1)).

generate_facts_ev_24_AND_bones([(Start,End) | Tail]) :- assert(ev_24_AND_bones(Start,End)), generate_facts_ev_24_AND_bones(Tail).

ev_24_AND_bones_aux() :- findall((Start,End),ev_24(Start,End),Interval1), findall((Start,End),bones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_24_AND_bones(Interval).

ev_24_AND_bones_at_2030(Res) :- setof((Start,End),ev_24_AND_bones(Start,End),AllINtervals), checkvalidity(2030,AllINtervals,Res).

check_query() :- write('Query = ev_24_AND_bones_at_2030'), (ev_24_AND_bones_at_2030(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_24_AND_bones_aux().

