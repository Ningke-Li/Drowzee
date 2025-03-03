:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

next_eastern_front(Start,End) :- eastern_front(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_eastern_front_at_1914(Res) :- setof((Start,End),next_eastern_front(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = next_eastern_front_at_1914'), (next_eastern_front_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).

