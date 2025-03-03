:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

finally_ev_30_rock_during_9_11(Start,End) :- ev_30_rock(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_ev_30_rock_during_9_11_at_1957(Res) :- setof((Start,End),finally_ev_30_rock_during_9_11(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = finally_ev_30_rock_during_9_11_at_1957'), (finally_ev_30_rock_during_9_11_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).

