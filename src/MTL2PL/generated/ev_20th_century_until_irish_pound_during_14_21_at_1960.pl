:- include('database.pl').
ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

irish_pound(Start,End) :- begin('irish_pound',_,_,Start), end('irish_pound',_,_,End), Start=<End.

ev_20th_century_last_till_14_21(Start,End) :- ev_20th_century(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

ev_20th_century_until_irish_pound_during_14_21_overlap(Start,End) :- ev_20th_century_last_till_14_21(Start1,End1), irish_pound(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_20th_century_until_irish_pound_during_14_21(Start,End) :- ev_20th_century(W1,_), ev_20th_century_until_irish_pound_during_14_21_overlap(Start1,End1), Start is max((Start1-21),W1), End is (End1-14), Start=<End.

ev_20th_century_until_irish_pound_during_14_21_at_1960(Res) :- setof((Start,End),ev_20th_century_until_irish_pound_during_14_21(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = ev_20th_century_until_irish_pound_during_14_21_at_1960'), (ev_20th_century_until_irish_pound_during_14_21_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).

