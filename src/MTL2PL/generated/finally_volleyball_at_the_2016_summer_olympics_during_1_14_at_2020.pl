:- include('database.pl').
volleyball_at_the_2016_summer_olympics(Start,End) :- begin('volleyball_at_the_2016_summer_olympics',_,_,Start), end('volleyball_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_volleyball_at_the_2016_summer_olympics_during_1_14(Start,End) :- volleyball_at_the_2016_summer_olympics(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_volleyball_at_the_2016_summer_olympics_during_1_14_at_2020(Res) :- setof((Start,End),finally_volleyball_at_the_2016_summer_olympics_during_1_14(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = finally_volleyball_at_the_2016_summer_olympics_during_1_14_at_2020'), (finally_volleyball_at_the_2016_summer_olympics_during_1_14_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).

