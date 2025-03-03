:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

big_time_rush(Start,End) :- begin('big_time_rush',_,_,Start), end('big_time_rush',_,_,End), Start=<End.

harry_potter_last_till_1_8(Start,End) :- harry_potter(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

harry_potter_until_big_time_rush_during_1_8_overlap(Start,End) :- harry_potter_last_till_1_8(Start1,End1), big_time_rush(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

harry_potter_until_big_time_rush_during_1_8(Start,End) :- harry_potter(W1,_), harry_potter_until_big_time_rush_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

harry_potter_until_big_time_rush_during_1_8_at_2011(Res) :- setof((Start,End),harry_potter_until_big_time_rush_during_1_8(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = harry_potter_until_big_time_rush_during_1_8_at_2011'), (harry_potter_until_big_time_rush_during_1_8_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

