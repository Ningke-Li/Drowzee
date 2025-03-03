:- include('database.pl').
ev_2015_tour_de_france(Start,End) :- begin('ev_2015_tour_de_france',_,_,Start), end('ev_2015_tour_de_france',_,_,End), Start=<End.

great_plague_of_london(Start,End) :- begin('great_plague_of_london',_,_,Start), end('great_plague_of_london',_,_,End), Start=<End.

generate_facts_ev_2015_tour_de_france_OR_great_plague_of_london([]) :- assert(ev_2015_tour_de_france_OR_great_plague_of_london(-1,-1)).

generate_facts_ev_2015_tour_de_france_OR_great_plague_of_london([(Start,End) | Tail]) :- assert(ev_2015_tour_de_france_OR_great_plague_of_london(Start,End)), generate_facts_ev_2015_tour_de_france_OR_great_plague_of_london(Tail).

ev_2015_tour_de_france_OR_great_plague_of_london_aux() :- findall((Start,End),ev_2015_tour_de_france(Start,End),Interval1), findall((Start,End),great_plague_of_london(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_tour_de_france_OR_great_plague_of_london(Interval).

ev_2015_tour_de_france_OR_great_plague_of_london_at_2015(Res) :- setof((Start,End),ev_2015_tour_de_france_OR_great_plague_of_london(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = ev_2015_tour_de_france_OR_great_plague_of_london_at_2015'), (ev_2015_tour_de_france_OR_great_plague_of_london_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_tour_de_france_OR_great_plague_of_london_aux().

