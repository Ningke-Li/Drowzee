:- include('database.pl').
wrestling_at_the_2016_summer_olympics(Start,End) :- begin('wrestling_at_the_2016_summer_olympics',_,_,Start), end('wrestling_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_wrestling_at_the_2016_summer_olympics(Start,End) :- wrestling_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_wrestling_at_the_2016_summer_olympics_at_1922(Res) :- setof((Start,End),next_wrestling_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = next_wrestling_at_the_2016_summer_olympics_at_1922'), (next_wrestling_at_the_2016_summer_olympics_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).

