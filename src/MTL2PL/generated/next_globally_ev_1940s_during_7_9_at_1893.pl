:- include('database.pl').
ev_1940s(Start,End) :- begin('ev_1940s',_,_,Start), end('ev_1940s',_,_,End), Start=<End.

globally_ev_1940s_during_7_9(Start,End) :- ev_1940s(Start1,End1), Start is (Start1-7), End is (End1-9), Start=<End.

next_globally_ev_1940s_during_7_9(Start,End) :- globally_ev_1940s_during_7_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_1940s_during_7_9_at_1893(Res) :- setof((Start,End),next_globally_ev_1940s_during_7_9(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_1940s_during_7_9_at_1893'), (next_globally_ev_1940s_during_7_9_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

