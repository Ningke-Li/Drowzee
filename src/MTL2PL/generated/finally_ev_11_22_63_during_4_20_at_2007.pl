:- include('database.pl').
ev_11_22_63(Start,End) :- begin('ev_11_22_63',_,_,Start), end('ev_11_22_63',_,_,End), Start=<End.

finally_ev_11_22_63_during_4_20(Start,End) :- ev_11_22_63(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_ev_11_22_63_during_4_20_at_2007(Res) :- setof((Start,End),finally_ev_11_22_63_during_4_20(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = finally_ev_11_22_63_during_4_20_at_2007'), (finally_ev_11_22_63_during_4_20_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

