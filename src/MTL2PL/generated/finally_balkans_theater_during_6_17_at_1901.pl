:- include('database.pl').
balkans_theater(Start,End) :- begin('balkans_theater',_,_,Start), end('balkans_theater',_,_,End), Start=<End.

finally_balkans_theater_during_6_17(Start,End) :- balkans_theater(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

finally_balkans_theater_during_6_17_at_1901(Res) :- setof((Start,End),finally_balkans_theater_during_6_17(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = finally_balkans_theater_during_6_17_at_1901'), (finally_balkans_theater_during_6_17_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).

