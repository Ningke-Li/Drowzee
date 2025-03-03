:- include('database.pl').
ev_1946_iran_crisis(Start,End) :- begin('ev_1946_iran_crisis',_,_,Start), end('ev_1946_iran_crisis',_,_,End), Start=<End.

finally_ev_1946_iran_crisis_during_3_12(Start,End) :- ev_1946_iran_crisis(Start1,End1), (Start1-12)=<(End1-3), Start is (Start1-12), End is (End1-3), Start=<End.

finally_ev_1946_iran_crisis_during_3_12_at_1859(Res) :- setof((Start,End),finally_ev_1946_iran_crisis_during_3_12(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1946_iran_crisis_during_3_12_at_1859'), (finally_ev_1946_iran_crisis_during_3_12_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

