:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

finally_mythbusters_during_5_17(Start,End) :- mythbusters(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

globally_finally_mythbusters_during_5_17_during_5_21(Start,End) :- finally_mythbusters_during_5_17(Start1,End1), Start is (Start1-5), End is (End1-21), Start=<End.

globally_finally_mythbusters_during_5_17_during_5_21_at_1888(Res) :- setof((Start,End),globally_finally_mythbusters_during_5_17_during_5_21(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mythbusters_during_5_17_during_5_21_at_1888'), (globally_finally_mythbusters_during_5_17_during_5_21_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

