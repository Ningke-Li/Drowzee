:- include('database.pl').
once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

finally_once_upon_a_time_during_2_20(Start,End) :- once_upon_a_time(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

next_finally_once_upon_a_time_during_2_20(Start,End) :- finally_once_upon_a_time_during_2_20(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_once_upon_a_time_during_2_20_at_1985(Res) :- setof((Start,End),next_finally_once_upon_a_time_during_2_20(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = next_finally_once_upon_a_time_during_2_20_at_1985'), (next_finally_once_upon_a_time_during_2_20_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

