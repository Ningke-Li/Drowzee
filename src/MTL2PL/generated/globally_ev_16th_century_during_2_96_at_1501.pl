:- include('database.pl').
ev_16th_century(Start,End) :- begin('ev_16th_century',_,_,Start), end('ev_16th_century',_,_,End), Start=<End.

globally_ev_16th_century_during_2_96(Start,End) :- ev_16th_century(Start1,End1), Start is (Start1-2), End is (End1-96), Start=<End.

globally_ev_16th_century_during_2_96_at_1501(Res) :- setof((Start,End),globally_ev_16th_century_during_2_96(Start,End),AllINtervals), checkvalidity(1501,AllINtervals,Res).

check_query() :- write('Query = globally_ev_16th_century_during_2_96_at_1501'), (globally_ev_16th_century_during_2_96_at_1501(true) -> write('\nRes   = true');write('\nRes   = false')).

