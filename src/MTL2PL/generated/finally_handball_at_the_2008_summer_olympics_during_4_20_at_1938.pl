:- include('database.pl').
handball_at_the_2008_summer_olympics(Start,End) :- begin('handball_at_the_2008_summer_olympics',_,_,Start), end('handball_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_handball_at_the_2008_summer_olympics_during_4_20(Start,End) :- handball_at_the_2008_summer_olympics(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_handball_at_the_2008_summer_olympics_during_4_20_at_1938(Res) :- setof((Start,End),finally_handball_at_the_2008_summer_olympics_during_4_20(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = finally_handball_at_the_2008_summer_olympics_during_4_20_at_1938'), (finally_handball_at_the_2008_summer_olympics_during_4_20_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

