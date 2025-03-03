:- include('database.pl').
basmachi_movement(Start,End) :- begin('basmachi_movement',_,_,Start), end('basmachi_movement',_,_,End), Start=<End.

finally_basmachi_movement_during_8_18(Start,End) :- basmachi_movement(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

globally_finally_basmachi_movement_during_8_18_during_3_17(Start,End) :- finally_basmachi_movement_during_8_18(Start1,End1), Start is (Start1-3), End is (End1-17), Start=<End.

globally_finally_basmachi_movement_during_8_18_during_3_17_at_1906(Res) :- setof((Start,End),globally_finally_basmachi_movement_during_8_18_during_3_17(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = globally_finally_basmachi_movement_during_8_18_during_3_17_at_1906'), (globally_finally_basmachi_movement_during_8_18_during_3_17_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

