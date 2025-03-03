:- include('database.pl').
deaths_in_2015(Start,End) :- begin('deaths_in_2015',_,_,Start), end('deaths_in_2015',_,_,End), Start=<End.

finally_deaths_in_2015_during_5_12(Start,End) :- deaths_in_2015(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

finally_deaths_in_2015_during_5_12_at_2023(Res) :- setof((Start,End),finally_deaths_in_2015_during_5_12(Start,End),AllINtervals), checkvalidity(2023,AllINtervals,Res).

check_query() :- write('Query = finally_deaths_in_2015_during_5_12_at_2023'), (finally_deaths_in_2015_during_5_12_at_2023(true) -> write('\nRes   = true');write('\nRes   = false')).

