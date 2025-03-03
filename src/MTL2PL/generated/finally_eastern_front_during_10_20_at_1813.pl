:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

finally_eastern_front_during_10_20(Start,End) :- eastern_front(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

finally_eastern_front_during_10_20_at_1813(Res) :- setof((Start,End),finally_eastern_front_during_10_20(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = finally_eastern_front_during_10_20_at_1813'), (finally_eastern_front_during_10_20_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).

