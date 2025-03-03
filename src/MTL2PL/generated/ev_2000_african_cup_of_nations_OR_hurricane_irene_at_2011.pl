:- include('database.pl').
ev_2000_african_cup_of_nations(Start,End) :- begin('ev_2000_african_cup_of_nations',_,_,Start), end('ev_2000_african_cup_of_nations',_,_,End), Start=<End.

hurricane_irene(Start,End) :- begin('hurricane_irene',_,_,Start), end('hurricane_irene',_,_,End), Start=<End.

generate_facts_ev_2000_african_cup_of_nations_OR_hurricane_irene([]) :- assert(ev_2000_african_cup_of_nations_OR_hurricane_irene(-1,-1)).

generate_facts_ev_2000_african_cup_of_nations_OR_hurricane_irene([(Start,End) | Tail]) :- assert(ev_2000_african_cup_of_nations_OR_hurricane_irene(Start,End)), generate_facts_ev_2000_african_cup_of_nations_OR_hurricane_irene(Tail).

ev_2000_african_cup_of_nations_OR_hurricane_irene_aux() :- findall((Start,End),ev_2000_african_cup_of_nations(Start,End),Interval1), findall((Start,End),hurricane_irene(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2000_african_cup_of_nations_OR_hurricane_irene(Interval).

ev_2000_african_cup_of_nations_OR_hurricane_irene_at_2011(Res) :- setof((Start,End),ev_2000_african_cup_of_nations_OR_hurricane_irene(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_2000_african_cup_of_nations_OR_hurricane_irene_at_2011'), (ev_2000_african_cup_of_nations_OR_hurricane_irene_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2000_african_cup_of_nations_OR_hurricane_irene_aux().

