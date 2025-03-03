:- include('database.pl').
basketball_at_the_2012_summer_olympics(Start,End) :- begin('basketball_at_the_2012_summer_olympics',_,_,Start), end('basketball_at_the_2012_summer_olympics',_,_,End), Start=<End.

next_basketball_at_the_2012_summer_olympics(Start,End) :- basketball_at_the_2012_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_basketball_at_the_2012_summer_olympics_at_2011(Res) :- setof((Start,End),next_basketball_at_the_2012_summer_olympics(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_basketball_at_the_2012_summer_olympics_at_2011'), (next_basketball_at_the_2012_summer_olympics_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

