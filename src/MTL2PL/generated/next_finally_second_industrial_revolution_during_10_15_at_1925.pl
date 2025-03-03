:- include('database.pl').
second_industrial_revolution(Start,End) :- begin('second_industrial_revolution',_,_,Start), end('second_industrial_revolution',_,_,End), Start=<End.

finally_second_industrial_revolution_during_10_15(Start,End) :- second_industrial_revolution(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

next_finally_second_industrial_revolution_during_10_15(Start,End) :- finally_second_industrial_revolution_during_10_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_second_industrial_revolution_during_10_15_at_1925(Res) :- setof((Start,End),next_finally_second_industrial_revolution_during_10_15(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = next_finally_second_industrial_revolution_during_10_15_at_1925'), (next_finally_second_industrial_revolution_during_10_15_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

