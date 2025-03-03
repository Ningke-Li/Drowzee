:- include('database.pl').
ev_11_22_63(Start,End) :- begin('ev_11_22_63',_,_,Start), end('ev_11_22_63',_,_,End), Start=<End.

finally_ev_11_22_63_during_5_19(Start,End) :- ev_11_22_63(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_ev_11_22_63_during_5_19_at_1899(Res) :- setof((Start,End),finally_ev_11_22_63_during_5_19(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = finally_ev_11_22_63_during_5_19_at_1899'), (finally_ev_11_22_63_during_5_19_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

