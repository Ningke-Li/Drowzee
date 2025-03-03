:- include('database.pl').
baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

finally_baby_boomers_during_7_13(Start,End) :- baby_boomers(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

next_finally_baby_boomers_during_7_13(Start,End) :- finally_baby_boomers_during_7_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_baby_boomers_during_7_13_at_1899(Res) :- setof((Start,End),next_finally_baby_boomers_during_7_13(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = next_finally_baby_boomers_during_7_13_at_1899'), (next_finally_baby_boomers_during_7_13_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

