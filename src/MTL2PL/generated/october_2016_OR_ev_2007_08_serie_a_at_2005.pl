:- include('database.pl').
october_2016(Start,End) :- begin('october_2016',_,_,Start), end('october_2016',_,_,End), Start=<End.

ev_2007_08_serie_a(Start,End) :- begin('ev_2007_08_serie_a',_,_,Start), end('ev_2007_08_serie_a',_,_,End), Start=<End.

generate_facts_october_2016_OR_ev_2007_08_serie_a([]) :- assert(october_2016_OR_ev_2007_08_serie_a(-1,-1)).

generate_facts_october_2016_OR_ev_2007_08_serie_a([(Start,End) | Tail]) :- assert(october_2016_OR_ev_2007_08_serie_a(Start,End)), generate_facts_october_2016_OR_ev_2007_08_serie_a(Tail).

october_2016_OR_ev_2007_08_serie_a_aux() :- findall((Start,End),october_2016(Start,End),Interval1), findall((Start,End),ev_2007_08_serie_a(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_october_2016_OR_ev_2007_08_serie_a(Interval).

october_2016_OR_ev_2007_08_serie_a_at_2005(Res) :- setof((Start,End),october_2016_OR_ev_2007_08_serie_a(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = october_2016_OR_ev_2007_08_serie_a_at_2005'), (october_2016_OR_ev_2007_08_serie_a_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- october_2016_OR_ev_2007_08_serie_a_aux().

