:- include('database.pl').
ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

ugly_betty_last_till_1_10(Start,End) :- ugly_betty(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ugly_betty_until_white_collar_during_1_10_overlap(Start,End) :- ugly_betty_last_till_1_10(Start1,End1), white_collar(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ugly_betty_until_white_collar_during_1_10(Start,End) :- ugly_betty(W1,_), ugly_betty_until_white_collar_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

ugly_betty_until_white_collar_during_1_10_at_2002(Res) :- setof((Start,End),ugly_betty_until_white_collar_during_1_10(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = ugly_betty_until_white_collar_during_1_10_at_2002'), (ugly_betty_until_white_collar_during_1_10_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

