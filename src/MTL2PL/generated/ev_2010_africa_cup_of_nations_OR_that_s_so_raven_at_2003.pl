:- include('database.pl').
ev_2010_africa_cup_of_nations(Start,End) :- begin('ev_2010_africa_cup_of_nations',_,_,Start), end('ev_2010_africa_cup_of_nations',_,_,End), Start=<End.

that_s_so_raven(Start,End) :- begin('that_s_so_raven',_,_,Start), end('that_s_so_raven',_,_,End), Start=<End.

generate_facts_ev_2010_africa_cup_of_nations_OR_that_s_so_raven([]) :- assert(ev_2010_africa_cup_of_nations_OR_that_s_so_raven(-1,-1)).

generate_facts_ev_2010_africa_cup_of_nations_OR_that_s_so_raven([(Start,End) | Tail]) :- assert(ev_2010_africa_cup_of_nations_OR_that_s_so_raven(Start,End)), generate_facts_ev_2010_africa_cup_of_nations_OR_that_s_so_raven(Tail).

ev_2010_africa_cup_of_nations_OR_that_s_so_raven_aux() :- findall((Start,End),ev_2010_africa_cup_of_nations(Start,End),Interval1), findall((Start,End),that_s_so_raven(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_africa_cup_of_nations_OR_that_s_so_raven(Interval).

ev_2010_africa_cup_of_nations_OR_that_s_so_raven_at_2003(Res) :- setof((Start,End),ev_2010_africa_cup_of_nations_OR_that_s_so_raven(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = ev_2010_africa_cup_of_nations_OR_that_s_so_raven_at_2003'), (ev_2010_africa_cup_of_nations_OR_that_s_so_raven_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_africa_cup_of_nations_OR_that_s_so_raven_aux().

