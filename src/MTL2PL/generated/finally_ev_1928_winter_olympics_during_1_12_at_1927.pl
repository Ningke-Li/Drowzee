:- include('database.pl').
ev_1928_winter_olympics(Start,End) :- begin('ev_1928_winter_olympics',_,_,Start), end('ev_1928_winter_olympics',_,_,End), Start=<End.

finally_ev_1928_winter_olympics_during_1_12(Start,End) :- ev_1928_winter_olympics(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

finally_ev_1928_winter_olympics_during_1_12_at_1927(Res) :- setof((Start,End),finally_ev_1928_winter_olympics_during_1_12(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1928_winter_olympics_during_1_12_at_1927'), (finally_ev_1928_winter_olympics_during_1_12_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

