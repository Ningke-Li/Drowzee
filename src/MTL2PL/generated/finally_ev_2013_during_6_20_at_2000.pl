:- include('database.pl').
ev_2013(Start,End) :- begin('ev_2013',_,_,Start), end('ev_2013',_,_,End), Start=<End.

finally_ev_2013_during_6_20(Start,End) :- ev_2013(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_ev_2013_during_6_20_at_2000(Res) :- setof((Start,End),finally_ev_2013_during_6_20(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_during_6_20_at_2000'), (finally_ev_2013_during_6_20_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

