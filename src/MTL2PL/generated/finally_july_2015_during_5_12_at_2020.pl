:- include('database.pl').
july_2015(Start,End) :- begin('july_2015',_,_,Start), end('july_2015',_,_,End), Start=<End.

finally_july_2015_during_5_12(Start,End) :- july_2015(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

finally_july_2015_during_5_12_at_2020(Res) :- setof((Start,End),finally_july_2015_during_5_12(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = finally_july_2015_during_5_12_at_2020'), (finally_july_2015_during_5_12_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).

