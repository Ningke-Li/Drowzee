:- include('database.pl').
basketball_at_the_2016_summer_olympics(Start,End) :- begin('basketball_at_the_2016_summer_olympics',_,_,Start), end('basketball_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_basketball_at_the_2016_summer_olympics_during_4_14(Start,End) :- basketball_at_the_2016_summer_olympics(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_basketball_at_the_2016_summer_olympics_during_4_14_at_1931(Res) :- setof((Start,End),finally_basketball_at_the_2016_summer_olympics_during_4_14(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = finally_basketball_at_the_2016_summer_olympics_during_4_14_at_1931'), (finally_basketball_at_the_2016_summer_olympics_during_4_14_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

