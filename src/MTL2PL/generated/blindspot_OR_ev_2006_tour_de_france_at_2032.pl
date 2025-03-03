:- include('database.pl').
blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

ev_2006_tour_de_france(Start,End) :- begin('ev_2006_tour_de_france',_,_,Start), end('ev_2006_tour_de_france',_,_,End), Start=<End.

generate_facts_blindspot_OR_ev_2006_tour_de_france([]) :- assert(blindspot_OR_ev_2006_tour_de_france(-1,-1)).

generate_facts_blindspot_OR_ev_2006_tour_de_france([(Start,End) | Tail]) :- assert(blindspot_OR_ev_2006_tour_de_france(Start,End)), generate_facts_blindspot_OR_ev_2006_tour_de_france(Tail).

blindspot_OR_ev_2006_tour_de_france_aux() :- findall((Start,End),blindspot(Start,End),Interval1), findall((Start,End),ev_2006_tour_de_france(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_blindspot_OR_ev_2006_tour_de_france(Interval).

blindspot_OR_ev_2006_tour_de_france_at_2032(Res) :- setof((Start,End),blindspot_OR_ev_2006_tour_de_france(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = blindspot_OR_ev_2006_tour_de_france_at_2032'), (blindspot_OR_ev_2006_tour_de_france_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).
?- blindspot_OR_ev_2006_tour_de_france_aux().

