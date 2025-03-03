:- include('database.pl').
rowing_at_the_2008_summer_olympics(Start,End) :- begin('rowing_at_the_2008_summer_olympics',_,_,Start), end('rowing_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_rowing_at_the_2008_summer_olympics_during_10_15(Start,End) :- rowing_at_the_2008_summer_olympics(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_rowing_at_the_2008_summer_olympics_during_10_15_at_1865(Res) :- setof((Start,End),finally_rowing_at_the_2008_summer_olympics_during_10_15(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = finally_rowing_at_the_2008_summer_olympics_during_10_15_at_1865'), (finally_rowing_at_the_2008_summer_olympics_during_10_15_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

