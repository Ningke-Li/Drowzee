:- include('database.pl').
icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

icarly_last_till_2_5(Start,End) :- icarly(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

icarly_until_boardwalk_empire_during_2_5_overlap(Start,End) :- icarly_last_till_2_5(Start1,End1), boardwalk_empire(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

icarly_until_boardwalk_empire_during_2_5(Start,End) :- icarly(W1,_), icarly_until_boardwalk_empire_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

icarly_until_boardwalk_empire_during_2_5_at_1946(Res) :- setof((Start,End),icarly_until_boardwalk_empire_during_2_5(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = icarly_until_boardwalk_empire_during_2_5_at_1946'), (icarly_until_boardwalk_empire_during_2_5_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).

