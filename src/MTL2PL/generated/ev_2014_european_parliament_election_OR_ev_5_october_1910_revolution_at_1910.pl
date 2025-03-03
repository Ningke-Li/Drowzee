:- include('database.pl').
ev_2014_european_parliament_election(Start,End) :- begin('ev_2014_european_parliament_election',_,_,Start), end('ev_2014_european_parliament_election',_,_,End), Start=<End.

ev_5_october_1910_revolution(Start,End) :- begin('ev_5_october_1910_revolution',_,_,Start), end('ev_5_october_1910_revolution',_,_,End), Start=<End.

generate_facts_ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution([]) :- assert(ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution(-1,-1)).

generate_facts_ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution([(Start,End) | Tail]) :- assert(ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution(Start,End)), generate_facts_ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution(Tail).

ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution_aux() :- findall((Start,End),ev_2014_european_parliament_election(Start,End),Interval1), findall((Start,End),ev_5_october_1910_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution(Interval).

ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution_at_1910(Res) :- setof((Start,End),ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution_at_1910'), (ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_european_parliament_election_OR_ev_5_october_1910_revolution_aux().

