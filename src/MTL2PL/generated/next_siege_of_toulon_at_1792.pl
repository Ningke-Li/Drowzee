:- include('database.pl').
siege_of_toulon(Start,End) :- begin('siege_of_toulon',_,_,Start), end('siege_of_toulon',_,_,End), Start=<End.

next_siege_of_toulon(Start,End) :- siege_of_toulon(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_siege_of_toulon_at_1792(Res) :- setof((Start,End),next_siege_of_toulon(Start,End),AllINtervals), checkvalidity(1792,AllINtervals,Res).

check_query() :- write('Query = next_siege_of_toulon_at_1792'), (next_siege_of_toulon_at_1792(true) -> write('\nRes   = true');write('\nRes   = false')).

