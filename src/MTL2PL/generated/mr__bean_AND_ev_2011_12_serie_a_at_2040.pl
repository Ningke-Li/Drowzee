:- include('database.pl').
mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

ev_2011_12_serie_a(Start,End) :- begin('ev_2011_12_serie_a',_,_,Start), end('ev_2011_12_serie_a',_,_,End), Start=<End.

generate_facts_mr__bean_AND_ev_2011_12_serie_a([]) :- assert(mr__bean_AND_ev_2011_12_serie_a(-1,-1)).

generate_facts_mr__bean_AND_ev_2011_12_serie_a([(Start,End) | Tail]) :- assert(mr__bean_AND_ev_2011_12_serie_a(Start,End)), generate_facts_mr__bean_AND_ev_2011_12_serie_a(Tail).

mr__bean_AND_ev_2011_12_serie_a_aux() :- findall((Start,End),mr__bean(Start,End),Interval1), findall((Start,End),ev_2011_12_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mr__bean_AND_ev_2011_12_serie_a(Interval).

mr__bean_AND_ev_2011_12_serie_a_at_2040(Res) :- setof((Start,End),mr__bean_AND_ev_2011_12_serie_a(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = mr__bean_AND_ev_2011_12_serie_a_at_2040'), (mr__bean_AND_ev_2011_12_serie_a_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mr__bean_AND_ev_2011_12_serie_a_aux().

