:- include('database.pl').
ev_2002_french_presidential_election(Start,End) :- begin('ev_2002_french_presidential_election',_,_,Start), end('ev_2002_french_presidential_election',_,_,End), Start=<End.

finally_ev_2002_french_presidential_election_during_5_19(Start,End) :- ev_2002_french_presidential_election(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_ev_2002_french_presidential_election_during_5_19_at_1992(Res) :- setof((Start,End),finally_ev_2002_french_presidential_election_during_5_19(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2002_french_presidential_election_during_5_19_at_1992'), (finally_ev_2002_french_presidential_election_during_5_19_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

