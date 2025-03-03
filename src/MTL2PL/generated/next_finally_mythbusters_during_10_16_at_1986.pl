:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

finally_mythbusters_during_10_16(Start,End) :- mythbusters(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

next_finally_mythbusters_during_10_16(Start,End) :- finally_mythbusters_during_10_16(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_mythbusters_during_10_16_at_1986(Res) :- setof((Start,End),next_finally_mythbusters_during_10_16(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = next_finally_mythbusters_during_10_16_at_1986'), (next_finally_mythbusters_during_10_16_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

