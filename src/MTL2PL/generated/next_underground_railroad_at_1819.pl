:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

next_underground_railroad(Start,End) :- underground_railroad(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_underground_railroad_at_1819(Res) :- setof((Start,End),next_underground_railroad(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = next_underground_railroad_at_1819'), (next_underground_railroad_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).

