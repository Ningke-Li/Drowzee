:- include('database.pl').
table_tennis_at_the_2016_summer_olympics(Start,End) :- begin('table_tennis_at_the_2016_summer_olympics',_,_,Start), end('table_tennis_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_table_tennis_at_the_2016_summer_olympics(Start,End) :- table_tennis_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_table_tennis_at_the_2016_summer_olympics_at_1984(Res) :- setof((Start,End),next_table_tennis_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = next_table_tennis_at_the_2016_summer_olympics_at_1984'), (next_table_tennis_at_the_2016_summer_olympics_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

