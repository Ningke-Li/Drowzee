:- include('database.pl').
dark_angel(Start,End) :- begin('dark_angel',_,_,Start), end('dark_angel',_,_,End), Start=<End.

next_dark_angel(Start,End) :- dark_angel(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_dark_angel_at_1899(Res) :- setof((Start,End),next_dark_angel(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = next_dark_angel_at_1899'), (next_dark_angel_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

