:- include('database.pl').
deaths_in_2013(Start,End) :- begin('deaths_in_2013',_,_,Start), end('deaths_in_2013',_,_,End), Start=<End.

finally_deaths_in_2013_during_1_17(Start,End) :- deaths_in_2013(Start1,End1), (Start1-17)=<(End1-1), Start is (Start1-17), End is (End1-1), Start=<End.

finally_deaths_in_2013_during_1_17_at_1975(Res) :- setof((Start,End),finally_deaths_in_2013_during_1_17(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = finally_deaths_in_2013_during_1_17_at_1975'), (finally_deaths_in_2013_during_1_17_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

