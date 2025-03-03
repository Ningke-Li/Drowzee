:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

finally_jessica_jones_during_3_11(Start,End) :- jessica_jones(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

finally_jessica_jones_during_3_11_at_2011(Res) :- setof((Start,End),finally_jessica_jones_during_3_11(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = finally_jessica_jones_during_3_11_at_2011'), (finally_jessica_jones_during_3_11_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

