:- include('database.pl').
ev_2013_italian_general_election(Start,End) :- begin('ev_2013_italian_general_election',_,_,Start), end('ev_2013_italian_general_election',_,_,End), Start=<End.

great_fire_of_london(Start,End) :- begin('great_fire_of_london',_,_,Start), end('great_fire_of_london',_,_,End), Start=<End.

generate_facts_ev_2013_italian_general_election_OR_great_fire_of_london([]) :- assert(ev_2013_italian_general_election_OR_great_fire_of_london(-1,-1)).

generate_facts_ev_2013_italian_general_election_OR_great_fire_of_london([(Start,End) | Tail]) :- assert(ev_2013_italian_general_election_OR_great_fire_of_london(Start,End)), generate_facts_ev_2013_italian_general_election_OR_great_fire_of_london(Tail).

ev_2013_italian_general_election_OR_great_fire_of_london_aux() :- findall((Start,End),ev_2013_italian_general_election(Start,End),Interval1), findall((Start,End),great_fire_of_london(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_italian_general_election_OR_great_fire_of_london(Interval).

ev_2013_italian_general_election_OR_great_fire_of_london_at_2013(Res) :- setof((Start,End),ev_2013_italian_general_election_OR_great_fire_of_london(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = ev_2013_italian_general_election_OR_great_fire_of_london_at_2013'), (ev_2013_italian_general_election_OR_great_fire_of_london_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_italian_general_election_OR_great_fire_of_london_aux().

