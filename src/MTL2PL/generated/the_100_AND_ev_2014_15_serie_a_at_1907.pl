:- include('database.pl').
the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

ev_2014_15_serie_a(Start,End) :- begin('ev_2014_15_serie_a',_,_,Start), end('ev_2014_15_serie_a',_,_,End), Start=<End.

generate_facts_the_100_AND_ev_2014_15_serie_a([]) :- assert(the_100_AND_ev_2014_15_serie_a(-1,-1)).

generate_facts_the_100_AND_ev_2014_15_serie_a([(Start,End) | Tail]) :- assert(the_100_AND_ev_2014_15_serie_a(Start,End)), generate_facts_the_100_AND_ev_2014_15_serie_a(Tail).

the_100_AND_ev_2014_15_serie_a_aux() :- findall((Start,End),the_100(Start,End),Interval1), findall((Start,End),ev_2014_15_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_100_AND_ev_2014_15_serie_a(Interval).

the_100_AND_ev_2014_15_serie_a_at_1907(Res) :- setof((Start,End),the_100_AND_ev_2014_15_serie_a(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = the_100_AND_ev_2014_15_serie_a_at_1907'), (the_100_AND_ev_2014_15_serie_a_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_100_AND_ev_2014_15_serie_a_aux().

