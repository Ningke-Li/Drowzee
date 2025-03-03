:- include('database.pl').
ev_2009_european_parliament_election(Start,End) :- begin('ev_2009_european_parliament_election',_,_,Start), end('ev_2009_european_parliament_election',_,_,End), Start=<End.

finally_ev_2009_european_parliament_election_during_9_17(Start,End) :- ev_2009_european_parliament_election(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_ev_2009_european_parliament_election_during_9_17_at_1915(Res) :- setof((Start,End),finally_ev_2009_european_parliament_election_during_9_17(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_european_parliament_election_during_9_17_at_1915'), (finally_ev_2009_european_parliament_election_during_9_17_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

