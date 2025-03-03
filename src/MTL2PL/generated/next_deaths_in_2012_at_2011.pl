:- include('database.pl').
deaths_in_2012(Start,End) :- begin('deaths_in_2012',_,_,Start), end('deaths_in_2012',_,_,End), Start=<End.

next_deaths_in_2012(Start,End) :- deaths_in_2012(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_deaths_in_2012_at_2011(Res) :- setof((Start,End),next_deaths_in_2012(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_deaths_in_2012_at_2011'), (next_deaths_in_2012_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

