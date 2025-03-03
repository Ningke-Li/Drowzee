:- include('database.pl').
ev_2006_africa_cup_of_nations(Start,End) :- begin('ev_2006_africa_cup_of_nations',_,_,Start), end('ev_2006_africa_cup_of_nations',_,_,End), Start=<End.

mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

generate_facts_ev_2006_africa_cup_of_nations_OR_mr__bean([]) :- assert(ev_2006_africa_cup_of_nations_OR_mr__bean(-1,-1)).

generate_facts_ev_2006_africa_cup_of_nations_OR_mr__bean([(Start,End) | Tail]) :- assert(ev_2006_africa_cup_of_nations_OR_mr__bean(Start,End)), generate_facts_ev_2006_africa_cup_of_nations_OR_mr__bean(Tail).

ev_2006_africa_cup_of_nations_OR_mr__bean_aux() :- findall((Start,End),ev_2006_africa_cup_of_nations(Start,End),Interval1), findall((Start,End),mr__bean(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2006_africa_cup_of_nations_OR_mr__bean(Interval).

ev_2006_africa_cup_of_nations_OR_mr__bean_at_1958(Res) :- setof((Start,End),ev_2006_africa_cup_of_nations_OR_mr__bean(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = ev_2006_africa_cup_of_nations_OR_mr__bean_at_1958'), (ev_2006_africa_cup_of_nations_OR_mr__bean_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_africa_cup_of_nations_OR_mr__bean_aux().

