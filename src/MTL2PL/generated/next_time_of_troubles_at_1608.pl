:- include('database.pl').
time_of_troubles(Start,End) :- begin('time_of_troubles',_,_,Start), end('time_of_troubles',_,_,End), Start=<End.

next_time_of_troubles(Start,End) :- time_of_troubles(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_time_of_troubles_at_1608(Res) :- setof((Start,End),next_time_of_troubles(Start,End),AllINtervals), checkvalidity(1608,AllINtervals,Res).

check_query() :- write('Query = next_time_of_troubles_at_1608'), (next_time_of_troubles_at_1608(true) -> write('\nRes   = true');write('\nRes   = false')).

