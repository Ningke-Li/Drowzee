:- include('database.pl').
ev_2010_11_serie_a(Start,End) :- begin('ev_2010_11_serie_a',_,_,Start), end('ev_2010_11_serie_a',_,_,End), Start=<End.

white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

generate_facts_ev_2010_11_serie_a_AND_white_collar([]) :- assert(ev_2010_11_serie_a_AND_white_collar(-1,-1)).

generate_facts_ev_2010_11_serie_a_AND_white_collar([(Start,End) | Tail]) :- assert(ev_2010_11_serie_a_AND_white_collar(Start,End)), generate_facts_ev_2010_11_serie_a_AND_white_collar(Tail).

ev_2010_11_serie_a_AND_white_collar_aux() :- findall((Start,End),ev_2010_11_serie_a(Start,End),Interval1), findall((Start,End),white_collar(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010_11_serie_a_AND_white_collar(Interval).

ev_2010_11_serie_a_AND_white_collar_at_2011(Res) :- setof((Start,End),ev_2010_11_serie_a_AND_white_collar(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_2010_11_serie_a_AND_white_collar_at_2011'), (ev_2010_11_serie_a_AND_white_collar_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_11_serie_a_AND_white_collar_aux().

