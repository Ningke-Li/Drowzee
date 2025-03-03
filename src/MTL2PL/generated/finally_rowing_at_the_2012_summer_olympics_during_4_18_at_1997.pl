:- include('database.pl').
rowing_at_the_2012_summer_olympics(Start,End) :- begin('rowing_at_the_2012_summer_olympics',_,_,Start), end('rowing_at_the_2012_summer_olympics',_,_,End), Start=<End.

finally_rowing_at_the_2012_summer_olympics_during_4_18(Start,End) :- rowing_at_the_2012_summer_olympics(Start1,End1), (Start1-18)=<(End1-4), Start is (Start1-18), End is (End1-4), Start=<End.

finally_rowing_at_the_2012_summer_olympics_during_4_18_at_1997(Res) :- setof((Start,End),finally_rowing_at_the_2012_summer_olympics_during_4_18(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_rowing_at_the_2012_summer_olympics_during_4_18_at_1997'), (finally_rowing_at_the_2012_summer_olympics_during_4_18_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

