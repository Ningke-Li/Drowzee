:- include('database.pl').
hundred_days_offensive(Start,End) :- begin('hundred_days_offensive',_,_,Start), end('hundred_days_offensive',_,_,End), Start=<End.

next_hundred_days_offensive(Start,End) :- hundred_days_offensive(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_hundred_days_offensive_at_1939(Res) :- setof((Start,End),next_hundred_days_offensive(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = next_hundred_days_offensive_at_1939'), (next_hundred_days_offensive_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

