:- include('database.pl').
equestrian_at_the_2016_summer_olympics(Start,End) :- begin('equestrian_at_the_2016_summer_olympics',_,_,Start), end('equestrian_at_the_2016_summer_olympics',_,_,End), Start=<End.

next_equestrian_at_the_2016_summer_olympics(Start,End) :- equestrian_at_the_2016_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_equestrian_at_the_2016_summer_olympics_at_1951(Res) :- setof((Start,End),next_equestrian_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = next_equestrian_at_the_2016_summer_olympics_at_1951'), (next_equestrian_at_the_2016_summer_olympics_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

