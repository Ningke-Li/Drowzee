:- include('database.pl').
avatar__the_last_airbender(Start,End) :- begin('avatar__the_last_airbender',_,_,Start), end('avatar__the_last_airbender',_,_,End), Start=<End.

ev_2009_european_parliament_election(Start,End) :- begin('ev_2009_european_parliament_election',_,_,Start), end('ev_2009_european_parliament_election',_,_,End), Start=<End.

generate_facts_avatar__the_last_airbender_OR_ev_2009_european_parliament_election([]) :- assert(avatar__the_last_airbender_OR_ev_2009_european_parliament_election(-1,-1)).

generate_facts_avatar__the_last_airbender_OR_ev_2009_european_parliament_election([(Start,End) | Tail]) :- assert(avatar__the_last_airbender_OR_ev_2009_european_parliament_election(Start,End)), generate_facts_avatar__the_last_airbender_OR_ev_2009_european_parliament_election(Tail).

avatar__the_last_airbender_OR_ev_2009_european_parliament_election_aux() :- findall((Start,End),avatar__the_last_airbender(Start,End),Interval1), findall((Start,End),ev_2009_european_parliament_election(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_avatar__the_last_airbender_OR_ev_2009_european_parliament_election(Interval).

avatar__the_last_airbender_OR_ev_2009_european_parliament_election_at_1960(Res) :- setof((Start,End),avatar__the_last_airbender_OR_ev_2009_european_parliament_election(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = avatar__the_last_airbender_OR_ev_2009_european_parliament_election_at_1960'), (avatar__the_last_airbender_OR_ev_2009_european_parliament_election_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- avatar__the_last_airbender_OR_ev_2009_european_parliament_election_aux().

