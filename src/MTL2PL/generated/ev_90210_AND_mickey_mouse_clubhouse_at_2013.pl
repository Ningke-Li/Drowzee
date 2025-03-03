:- include('database.pl').
ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

generate_facts_ev_90210_AND_mickey_mouse_clubhouse([]) :- assert(ev_90210_AND_mickey_mouse_clubhouse(-1,-1)).

generate_facts_ev_90210_AND_mickey_mouse_clubhouse([(Start,End) | Tail]) :- assert(ev_90210_AND_mickey_mouse_clubhouse(Start,End)), generate_facts_ev_90210_AND_mickey_mouse_clubhouse(Tail).

ev_90210_AND_mickey_mouse_clubhouse_aux() :- findall((Start,End),ev_90210(Start,End),Interval1), findall((Start,End),mickey_mouse_clubhouse(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_90210_AND_mickey_mouse_clubhouse(Interval).

ev_90210_AND_mickey_mouse_clubhouse_at_2013(Res) :- setof((Start,End),ev_90210_AND_mickey_mouse_clubhouse(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = ev_90210_AND_mickey_mouse_clubhouse_at_2013'), (ev_90210_AND_mickey_mouse_clubhouse_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_90210_AND_mickey_mouse_clubhouse_aux().

