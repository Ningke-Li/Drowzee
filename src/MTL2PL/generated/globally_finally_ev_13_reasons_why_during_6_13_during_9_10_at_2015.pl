:- include('database.pl').
ev_13_reasons_why(Start,End) :- begin('ev_13_reasons_why',_,_,Start), end('ev_13_reasons_why',_,_,End), Start=<End.

finally_ev_13_reasons_why_during_6_13(Start,End) :- ev_13_reasons_why(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

globally_finally_ev_13_reasons_why_during_6_13_during_9_10(Start,End) :- finally_ev_13_reasons_why_during_6_13(Start1,End1), Start is (Start1-9), End is (End1-10), Start=<End.

globally_finally_ev_13_reasons_why_during_6_13_during_9_10_at_2015(Res) :- setof((Start,End),globally_finally_ev_13_reasons_why_during_6_13_during_9_10(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ev_13_reasons_why_during_6_13_during_9_10_at_2015'), (globally_finally_ev_13_reasons_why_during_6_13_during_9_10_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

