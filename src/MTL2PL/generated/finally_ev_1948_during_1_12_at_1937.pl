:- include('database.pl').
ev_1948(Start,End) :- begin('ev_1948',_,_,Start), end('ev_1948',_,_,End), Start=<End.

finally_ev_1948_during_1_12(Start,End) :- ev_1948(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

finally_ev_1948_during_1_12_at_1937(Res) :- setof((Start,End),finally_ev_1948_during_1_12(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1948_during_1_12_at_1937'), (finally_ev_1948_during_1_12_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

