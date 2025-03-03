:- include('database.pl').
athletics_at_the_2016_summer_olympics(Start,End) :- begin('athletics_at_the_2016_summer_olympics',_,_,Start), end('athletics_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_athletics_at_the_2016_summer_olympics_during_4_20(Start,End) :- athletics_at_the_2016_summer_olympics(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_athletics_at_the_2016_summer_olympics_during_4_20_at_2047(Res) :- setof((Start,End),finally_athletics_at_the_2016_summer_olympics_during_4_20(Start,End),AllINtervals), checkvalidity(2047,AllINtervals,Res).

check_query() :- write('Query = finally_athletics_at_the_2016_summer_olympics_during_4_20_at_2047'), (finally_athletics_at_the_2016_summer_olympics_during_4_20_at_2047(true) -> write('\nRes   = true');write('\nRes   = false')).

