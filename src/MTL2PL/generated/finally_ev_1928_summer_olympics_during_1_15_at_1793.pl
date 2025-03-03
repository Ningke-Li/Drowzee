:- include('database.pl').
ev_1928_summer_olympics(Start,End) :- begin('ev_1928_summer_olympics',_,_,Start), end('ev_1928_summer_olympics',_,_,End), Start=<End.

finally_ev_1928_summer_olympics_during_1_15(Start,End) :- ev_1928_summer_olympics(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_ev_1928_summer_olympics_during_1_15_at_1793(Res) :- setof((Start,End),finally_ev_1928_summer_olympics_during_1_15(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1928_summer_olympics_during_1_15_at_1793'), (finally_ev_1928_summer_olympics_during_1_15_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

