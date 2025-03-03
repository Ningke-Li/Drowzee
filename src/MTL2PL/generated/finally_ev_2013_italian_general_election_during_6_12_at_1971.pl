:- include('database.pl').
ev_2013_italian_general_election(Start,End) :- begin('ev_2013_italian_general_election',_,_,Start), end('ev_2013_italian_general_election',_,_,End), Start=<End.

finally_ev_2013_italian_general_election_during_6_12(Start,End) :- ev_2013_italian_general_election(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_ev_2013_italian_general_election_during_6_12_at_1971(Res) :- setof((Start,End),finally_ev_2013_italian_general_election_during_6_12(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_italian_general_election_during_6_12_at_1971'), (finally_ev_2013_italian_general_election_during_6_12_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).

