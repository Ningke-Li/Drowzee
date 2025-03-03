:- include('database.pl').
deaths_in_2015(Start,End) :- begin('deaths_in_2015',_,_,Start), end('deaths_in_2015',_,_,End), Start=<End.

next_deaths_in_2015(Start,End) :- deaths_in_2015(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_deaths_in_2015_at_1931(Res) :- setof((Start,End),next_deaths_in_2015(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = next_deaths_in_2015_at_1931'), (next_deaths_in_2015_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

