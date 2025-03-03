:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

fringe(Start,End) :- begin('fringe',_,_,Start), end('fringe',_,_,End), Start=<End.

generate_facts_ev_3rd_millennium_AND_fringe([]) :- assert(ev_3rd_millennium_AND_fringe(-1,-1)).

generate_facts_ev_3rd_millennium_AND_fringe([(Start,End) | Tail]) :- assert(ev_3rd_millennium_AND_fringe(Start,End)), generate_facts_ev_3rd_millennium_AND_fringe(Tail).

ev_3rd_millennium_AND_fringe_aux() :- findall((Start,End),ev_3rd_millennium(Start,End),Interval1), findall((Start,End),fringe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_3rd_millennium_AND_fringe(Interval).

ev_3rd_millennium_AND_fringe_at_2012(Res) :- setof((Start,End),ev_3rd_millennium_AND_fringe(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_AND_fringe_at_2012'), (ev_3rd_millennium_AND_fringe_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_3rd_millennium_AND_fringe_aux().

