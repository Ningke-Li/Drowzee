:- include('database.pl').
ev_1930s(Start,End) :- begin('ev_1930s',_,_,Start), end('ev_1930s',_,_,End), Start=<End.

globally_ev_1930s_during_5_7(Start,End) :- ev_1930s(Start1,End1), Start is (Start1-5), End is (End1-7), Start=<End.

finally_globally_ev_1930s_during_5_7_during_7_19(Start,End) :- globally_ev_1930s_during_5_7(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_globally_ev_1930s_during_5_7_during_7_19_at_1764(Res) :- setof((Start,End),finally_globally_ev_1930s_during_5_7_during_7_19(Start,End),AllINtervals), checkvalidity(1764,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev_1930s_during_5_7_during_7_19_at_1764'), (finally_globally_ev_1930s_during_5_7_during_7_19_at_1764(true) -> write('\nRes   = true');write('\nRes   = false')).

