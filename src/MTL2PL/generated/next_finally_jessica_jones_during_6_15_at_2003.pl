:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

finally_jessica_jones_during_6_15(Start,End) :- jessica_jones(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

next_finally_jessica_jones_during_6_15(Start,End) :- finally_jessica_jones_during_6_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_jessica_jones_during_6_15_at_2003(Res) :- setof((Start,End),next_finally_jessica_jones_during_6_15(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = next_finally_jessica_jones_during_6_15_at_2003'), (next_finally_jessica_jones_during_6_15_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

