:- include('database.pl').
rugby_sevens_at_the_2016_summer_olympics(Start,End) :- begin('rugby_sevens_at_the_2016_summer_olympics',_,_,Start), end('rugby_sevens_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_rugby_sevens_at_the_2016_summer_olympics_during_2_12(Start,End) :- rugby_sevens_at_the_2016_summer_olympics(Start1,End1), (Start1-12)=<(End1-2), Start is (Start1-12), End is (End1-2), Start=<End.

finally_rugby_sevens_at_the_2016_summer_olympics_during_2_12_at_1991(Res) :- setof((Start,End),finally_rugby_sevens_at_the_2016_summer_olympics_during_2_12(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = finally_rugby_sevens_at_the_2016_summer_olympics_during_2_12_at_1991'), (finally_rugby_sevens_at_the_2016_summer_olympics_during_2_12_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

