:- include('database.pl').
ev_2014(Start,End) :- begin('ev_2014',_,_,Start), end('ev_2014',_,_,End), Start=<End.

finally_ev_2014_during_10_13(Start,End) :- ev_2014(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

finally_ev_2014_during_10_13_at_2003(Res) :- setof((Start,End),finally_ev_2014_during_10_13(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_during_10_13_at_2003'), (finally_ev_2014_during_10_13_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

