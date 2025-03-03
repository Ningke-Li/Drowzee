:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

globally_jessica_jones_during_2_4(Start,End) :- jessica_jones(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

globally_jessica_jones_during_2_4_at_2025(Res) :- setof((Start,End),globally_jessica_jones_during_2_4(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = globally_jessica_jones_during_2_4_at_2025'), (globally_jessica_jones_during_2_4_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).

