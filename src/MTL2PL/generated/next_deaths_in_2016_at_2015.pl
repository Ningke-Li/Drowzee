:- include('database.pl').
deaths_in_2016(Start,End) :- begin('deaths_in_2016',_,_,Start), end('deaths_in_2016',_,_,End), Start=<End.

next_deaths_in_2016(Start,End) :- deaths_in_2016(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_deaths_in_2016_at_2015(Res) :- setof((Start,End),next_deaths_in_2016(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_deaths_in_2016_at_2015'), (next_deaths_in_2016_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

