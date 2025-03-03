:- include('database.pl').
once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

finally_once_upon_a_time_during_5_16(Start,End) :- once_upon_a_time(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

finally_once_upon_a_time_during_5_16_at_2003(Res) :- setof((Start,End),finally_once_upon_a_time_during_5_16(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_once_upon_a_time_during_5_16_at_2003'), (finally_once_upon_a_time_during_5_16_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

