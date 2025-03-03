:- include('database.pl').
ev_5_october_1910_revolution(Start,End) :- begin('ev_5_october_1910_revolution',_,_,Start), end('ev_5_october_1910_revolution',_,_,End), Start=<End.

finally_ev_5_october_1910_revolution_during_1_17(Start,End) :- ev_5_october_1910_revolution(Start1,End1), (Start1-17)=<(End1-1), Start is (Start1-17), End is (End1-1), Start=<End.

finally_ev_5_october_1910_revolution_during_1_17_at_1774(Res) :- setof((Start,End),finally_ev_5_october_1910_revolution_during_1_17(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = finally_ev_5_october_1910_revolution_during_1_17_at_1774'), (finally_ev_5_october_1910_revolution_during_1_17_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).

