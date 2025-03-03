:- include('database.pl').
ev_2014_european_parliament_election(Start,End) :- begin('ev_2014_european_parliament_election',_,_,Start), end('ev_2014_european_parliament_election',_,_,End), Start=<End.

next_ev_2014_european_parliament_election(Start,End) :- ev_2014_european_parliament_election(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_european_parliament_election_at_2034(Res) :- setof((Start,End),next_ev_2014_european_parliament_election(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_european_parliament_election_at_2034'), (next_ev_2014_european_parliament_election_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).

