:- include('database.pl').
kyle_xy(Start,End) :- begin('kyle_xy',_,_,Start), end('kyle_xy',_,_,End), Start=<End.

finally_kyle_xy_during_2_16(Start,End) :- kyle_xy(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_kyle_xy_during_2_16_at_2006(Res) :- setof((Start,End),finally_kyle_xy_during_2_16(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_kyle_xy_during_2_16_at_2006'), (finally_kyle_xy_during_2_16_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

