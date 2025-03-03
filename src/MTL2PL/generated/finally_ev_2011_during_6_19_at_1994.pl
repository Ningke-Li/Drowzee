:- include('database.pl').
ev_2011(Start,End) :- begin('ev_2011',_,_,Start), end('ev_2011',_,_,End), Start=<End.

finally_ev_2011_during_6_19(Start,End) :- ev_2011(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_ev_2011_during_6_19_at_1994(Res) :- setof((Start,End),finally_ev_2011_during_6_19(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2011_during_6_19_at_1994'), (finally_ev_2011_during_6_19_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

