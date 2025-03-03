:- include('database.pl').
volleyball_at_the_2012_summer_olympics(Start,End) :- begin('volleyball_at_the_2012_summer_olympics',_,_,Start), end('volleyball_at_the_2012_summer_olympics',_,_,End), Start=<End.

finally_volleyball_at_the_2012_summer_olympics_during_9_17(Start,End) :- volleyball_at_the_2012_summer_olympics(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_volleyball_at_the_2012_summer_olympics_during_9_17_at_2001(Res) :- setof((Start,End),finally_volleyball_at_the_2012_summer_olympics_during_9_17(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_volleyball_at_the_2012_summer_olympics_during_9_17_at_2001'), (finally_volleyball_at_the_2012_summer_olympics_during_9_17_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

