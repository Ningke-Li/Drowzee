:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

arab_spring(Start,End) :- begin('arab_spring',_,_,Start), end('arab_spring',_,_,End), Start=<End.

generate_facts_ev_3rd_millennium_AND_arab_spring([]) :- assert(ev_3rd_millennium_AND_arab_spring(-1,-1)).

generate_facts_ev_3rd_millennium_AND_arab_spring([(Start,End) | Tail]) :- assert(ev_3rd_millennium_AND_arab_spring(Start,End)), generate_facts_ev_3rd_millennium_AND_arab_spring(Tail).

ev_3rd_millennium_AND_arab_spring_aux() :- findall((Start,End),ev_3rd_millennium(Start,End),Interval1), findall((Start,End),arab_spring(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_3rd_millennium_AND_arab_spring(Interval).

ev_3rd_millennium_AND_arab_spring_at_2011(Res) :- setof((Start,End),ev_3rd_millennium_AND_arab_spring(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_AND_arab_spring_at_2011'), (ev_3rd_millennium_AND_arab_spring_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_3rd_millennium_AND_arab_spring_aux().

