:- include('database.pl').
deaths_in_2016(Start,End) :- begin('deaths_in_2016',_,_,Start), end('deaths_in_2016',_,_,End), Start=<End.

finally_deaths_in_2016_during_10_12(Start,End) :- deaths_in_2016(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_deaths_in_2016_during_10_12_at_1919(Res) :- setof((Start,End),finally_deaths_in_2016_during_10_12(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = finally_deaths_in_2016_during_10_12_at_1919'), (finally_deaths_in_2016_during_10_12_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

