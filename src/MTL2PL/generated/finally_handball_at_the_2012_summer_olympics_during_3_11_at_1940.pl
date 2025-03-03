:- include('database.pl').
handball_at_the_2012_summer_olympics(Start,End) :- begin('handball_at_the_2012_summer_olympics',_,_,Start), end('handball_at_the_2012_summer_olympics',_,_,End), Start=<End.

finally_handball_at_the_2012_summer_olympics_during_3_11(Start,End) :- handball_at_the_2012_summer_olympics(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

finally_handball_at_the_2012_summer_olympics_during_3_11_at_1940(Res) :- setof((Start,End),finally_handball_at_the_2012_summer_olympics_during_3_11(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = finally_handball_at_the_2012_summer_olympics_during_3_11_at_1940'), (finally_handball_at_the_2012_summer_olympics_during_3_11_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

