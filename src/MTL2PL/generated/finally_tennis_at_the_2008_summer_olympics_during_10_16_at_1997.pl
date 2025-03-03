:- include('database.pl').
tennis_at_the_2008_summer_olympics(Start,End) :- begin('tennis_at_the_2008_summer_olympics',_,_,Start), end('tennis_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_tennis_at_the_2008_summer_olympics_during_10_16(Start,End) :- tennis_at_the_2008_summer_olympics(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_tennis_at_the_2008_summer_olympics_during_10_16_at_1997(Res) :- setof((Start,End),finally_tennis_at_the_2008_summer_olympics_during_10_16(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_tennis_at_the_2008_summer_olympics_during_10_16_at_1997'), (finally_tennis_at_the_2008_summer_olympics_during_10_16_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

