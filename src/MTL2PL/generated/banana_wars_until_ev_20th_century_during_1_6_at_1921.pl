:- include('database.pl').
banana_wars(Start,End) :- begin('banana_wars',_,_,Start), end('banana_wars',_,_,End), Start=<End.

ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

banana_wars_last_till_1_6(Start,End) :- banana_wars(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

banana_wars_until_ev_20th_century_during_1_6_overlap(Start,End) :- banana_wars_last_till_1_6(Start1,End1), ev_20th_century(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

banana_wars_until_ev_20th_century_during_1_6(Start,End) :- banana_wars(W1,_), banana_wars_until_ev_20th_century_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

banana_wars_until_ev_20th_century_during_1_6_at_1921(Res) :- setof((Start,End),banana_wars_until_ev_20th_century_during_1_6(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = banana_wars_until_ev_20th_century_during_1_6_at_1921'), (banana_wars_until_ev_20th_century_during_1_6_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

