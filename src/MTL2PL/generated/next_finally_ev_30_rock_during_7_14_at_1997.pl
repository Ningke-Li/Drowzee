:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

finally_ev_30_rock_during_7_14(Start,End) :- ev_30_rock(Start1,End1), (Start1-14)=<(End1-7), Start is (Start1-14), End is (End1-7), Start=<End.

next_finally_ev_30_rock_during_7_14(Start,End) :- finally_ev_30_rock_during_7_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_ev_30_rock_during_7_14_at_1997(Res) :- setof((Start,End),next_finally_ev_30_rock_during_7_14(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = next_finally_ev_30_rock_during_7_14_at_1997'), (next_finally_ev_30_rock_during_7_14_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

