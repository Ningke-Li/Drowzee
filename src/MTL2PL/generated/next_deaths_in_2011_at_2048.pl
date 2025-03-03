:- include('database.pl').
deaths_in_2011(Start,End) :- begin('deaths_in_2011',_,_,Start), end('deaths_in_2011',_,_,End), Start=<End.

next_deaths_in_2011(Start,End) :- deaths_in_2011(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_deaths_in_2011_at_2048(Res) :- setof((Start,End),next_deaths_in_2011(Start,End),AllINtervals), checkvalidity(2048,AllINtervals,Res).

check_query() :- write('Query = next_deaths_in_2011_at_2048'), (next_deaths_in_2011_at_2048(true) -> write('\nRes   = true');write('\nRes   = false')).

