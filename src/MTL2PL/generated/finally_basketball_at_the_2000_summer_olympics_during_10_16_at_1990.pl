:- include('database.pl').
basketball_at_the_2000_summer_olympics(Start,End) :- begin('basketball_at_the_2000_summer_olympics',_,_,Start), end('basketball_at_the_2000_summer_olympics',_,_,End), Start=<End.

finally_basketball_at_the_2000_summer_olympics_during_10_16(Start,End) :- basketball_at_the_2000_summer_olympics(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_basketball_at_the_2000_summer_olympics_during_10_16_at_1990(Res) :- setof((Start,End),finally_basketball_at_the_2000_summer_olympics_during_10_16(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = finally_basketball_at_the_2000_summer_olympics_during_10_16_at_1990'), (finally_basketball_at_the_2000_summer_olympics_during_10_16_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

