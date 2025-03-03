:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

mythbusters_last_till_4_10(Start,End) :- mythbusters(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

mythbusters_until_atlanta_during_4_10_overlap(Start,End) :- mythbusters_last_till_4_10(Start1,End1), atlanta(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mythbusters_until_atlanta_during_4_10(Start,End) :- mythbusters(W1,_), mythbusters_until_atlanta_during_4_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-4), Start=<End.

mythbusters_until_atlanta_during_4_10_at_1910(Res) :- setof((Start,End),mythbusters_until_atlanta_during_4_10(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = mythbusters_until_atlanta_during_4_10_at_1910'), (mythbusters_until_atlanta_during_4_10_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).

