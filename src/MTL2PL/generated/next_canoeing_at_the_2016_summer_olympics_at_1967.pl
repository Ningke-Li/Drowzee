:- include('database.pl').
canoeing_at_the_2016_summer_olympics(Start,End) :- begin('canoeing_at_the_2016_summer_olympics',_,_,Start), end('canoeing_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_canoeing_at_the_2016_summer_olympics(Start,End) :- canoeing_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_canoeing_at_the_2016_summer_olympics_at_1967(Res) :- setof((Start,End),next_canoeing_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = next_canoeing_at_the_2016_summer_olympics_at_1967'), (next_canoeing_at_the_2016_summer_olympics_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).

