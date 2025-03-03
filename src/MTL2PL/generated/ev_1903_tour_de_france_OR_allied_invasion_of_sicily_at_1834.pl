:- include('database.pl').
ev_1903_tour_de_france(Start,End) :- begin('ev_1903_tour_de_france',_,_,Start), end('ev_1903_tour_de_france',_,_,End), Start=<End.

allied_invasion_of_sicily(Start,End) :- begin('allied_invasion_of_sicily',_,_,Start), end('allied_invasion_of_sicily',_,_,End), Start=<End.

generate_facts_ev_1903_tour_de_france_OR_allied_invasion_of_sicily([]) :- assert(ev_1903_tour_de_france_OR_allied_invasion_of_sicily(-1,-1)).

generate_facts_ev_1903_tour_de_france_OR_allied_invasion_of_sicily([(Start,End) | Tail]) :- assert(ev_1903_tour_de_france_OR_allied_invasion_of_sicily(Start,End)), generate_facts_ev_1903_tour_de_france_OR_allied_invasion_of_sicily(Tail).

ev_1903_tour_de_france_OR_allied_invasion_of_sicily_aux() :- findall((Start,End),ev_1903_tour_de_france(Start,End),Interval1), findall((Start,End),allied_invasion_of_sicily(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1903_tour_de_france_OR_allied_invasion_of_sicily(Interval).

ev_1903_tour_de_france_OR_allied_invasion_of_sicily_at_1834(Res) :- setof((Start,End),ev_1903_tour_de_france_OR_allied_invasion_of_sicily(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = ev_1903_tour_de_france_OR_allied_invasion_of_sicily_at_1834'), (ev_1903_tour_de_france_OR_allied_invasion_of_sicily_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1903_tour_de_france_OR_allied_invasion_of_sicily_aux().

