:- include('database.pl').
ev_16th_century(Start,End) :- begin('ev_16th_century',_,_,Start), end('ev_16th_century',_,_,End), Start=<End.

finally_ev_16th_century_during_3_18(Start,End) :- ev_16th_century(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

globally_finally_ev_16th_century_during_3_18_during_59_86(Start,End) :- finally_ev_16th_century_during_3_18(Start1,End1), Start is (Start1-59), End is (End1-86), Start=<End.

globally_finally_ev_16th_century_during_3_18_during_59_86_at_1383(Res) :- setof((Start,End),globally_finally_ev_16th_century_during_3_18_during_59_86(Start,End),AllINtervals), checkvalidity(1383,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ev_16th_century_during_3_18_during_59_86_at_1383'), (globally_finally_ev_16th_century_during_3_18_during_59_86_at_1383(true) -> write('\nRes   = true');write('\nRes   = false')).

