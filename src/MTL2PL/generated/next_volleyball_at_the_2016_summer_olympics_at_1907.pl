:- include('database.pl').
volleyball_at_the_2016_summer_olympics(Start,End) :- begin('volleyball_at_the_2016_summer_olympics',_,_,Start), end('volleyball_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_volleyball_at_the_2016_summer_olympics(Start,End) :- volleyball_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_volleyball_at_the_2016_summer_olympics_at_1907(Res) :- setof((Start,End),next_volleyball_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = next_volleyball_at_the_2016_summer_olympics_at_1907'), (next_volleyball_at_the_2016_summer_olympics_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).

