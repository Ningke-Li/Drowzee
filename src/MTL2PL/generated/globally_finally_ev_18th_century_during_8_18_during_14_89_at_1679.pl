:- include('database.pl').
ev_18th_century(Start,End) :- begin('ev_18th_century',_,_,Start), end('ev_18th_century',_,_,End), Start=<End.

finally_ev_18th_century_during_8_18(Start,End) :- ev_18th_century(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

globally_finally_ev_18th_century_during_8_18_during_14_89(Start,End) :- finally_ev_18th_century_during_8_18(Start1,End1), Start is (Start1-14), End is (End1-89), Start=<End.

globally_finally_ev_18th_century_during_8_18_during_14_89_at_1679(Res) :- setof((Start,End),globally_finally_ev_18th_century_during_8_18_during_14_89(Start,End),AllINtervals), checkvalidity(1679,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ev_18th_century_during_8_18_during_14_89_at_1679'), (globally_finally_ev_18th_century_during_8_18_during_14_89_at_1679(true) -> write('\nRes   = true');write('\nRes   = false')).

