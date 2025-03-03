:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

sherlock_last_till_2_9(Start,End) :- sherlock(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

sherlock_until_ev_21st_century_fox_during_2_9_overlap(Start,End) :- sherlock_last_till_2_9(Start1,End1), ev_21st_century_fox(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sherlock_until_ev_21st_century_fox_during_2_9(Start,End) :- sherlock(W1,_), sherlock_until_ev_21st_century_fox_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

sherlock_until_ev_21st_century_fox_during_2_9_at_2053(Res) :- setof((Start,End),sherlock_until_ev_21st_century_fox_during_2_9(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = sherlock_until_ev_21st_century_fox_during_2_9_at_2053'), (sherlock_until_ev_21st_century_fox_during_2_9_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).

