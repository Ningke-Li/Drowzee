:- include('database.pl').
ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

generate_facts_ev_2016_17_serie_a_AND_the_100([]) :- assert(ev_2016_17_serie_a_AND_the_100(-1,-1)).

generate_facts_ev_2016_17_serie_a_AND_the_100([(Start,End) | Tail]) :- assert(ev_2016_17_serie_a_AND_the_100(Start,End)), generate_facts_ev_2016_17_serie_a_AND_the_100(Tail).

ev_2016_17_serie_a_AND_the_100_aux() :- findall((Start,End),ev_2016_17_serie_a(Start,End),Interval1), findall((Start,End),the_100(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2016_17_serie_a_AND_the_100(Interval).

ev_2016_17_serie_a_AND_the_100_at_2016(Res) :- setof((Start,End),ev_2016_17_serie_a_AND_the_100(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_2016_17_serie_a_AND_the_100_at_2016'), (ev_2016_17_serie_a_AND_the_100_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2016_17_serie_a_AND_the_100_aux().

