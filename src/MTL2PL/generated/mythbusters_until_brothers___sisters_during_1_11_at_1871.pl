:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

mythbusters_last_till_1_11(Start,End) :- mythbusters(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

mythbusters_until_brothers___sisters_during_1_11_overlap(Start,End) :- mythbusters_last_till_1_11(Start1,End1), brothers___sisters(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mythbusters_until_brothers___sisters_during_1_11(Start,End) :- mythbusters(W1,_), mythbusters_until_brothers___sisters_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

mythbusters_until_brothers___sisters_during_1_11_at_1871(Res) :- setof((Start,End),mythbusters_until_brothers___sisters_during_1_11(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = mythbusters_until_brothers___sisters_during_1_11_at_1871'), (mythbusters_until_brothers___sisters_during_1_11_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

