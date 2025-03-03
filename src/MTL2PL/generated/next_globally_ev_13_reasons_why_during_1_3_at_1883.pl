:- include('database.pl').
ev_13_reasons_why(Start,End) :- begin('ev_13_reasons_why',_,_,Start), end('ev_13_reasons_why',_,_,End), Start=<End.

globally_ev_13_reasons_why_during_1_3(Start,End) :- ev_13_reasons_why(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_ev_13_reasons_why_during_1_3(Start,End) :- globally_ev_13_reasons_why_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_13_reasons_why_during_1_3_at_1883(Res) :- setof((Start,End),next_globally_ev_13_reasons_why_during_1_3(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_13_reasons_why_during_1_3_at_1883'), (next_globally_ev_13_reasons_why_during_1_3_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

