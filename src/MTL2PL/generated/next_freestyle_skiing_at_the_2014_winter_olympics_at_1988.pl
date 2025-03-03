:- include('database.pl').
freestyle_skiing_at_the_2014_winter_olympics(Start,End) :- begin('freestyle_skiing_at_the_2014_winter_olympics',_,_,Start), end('freestyle_skiing_at_the_2014_winter_olympics',_,_,End), Start=<End.

next_freestyle_skiing_at_the_2014_winter_olympics(Start,End) :- freestyle_skiing_at_the_2014_winter_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_freestyle_skiing_at_the_2014_winter_olympics_at_1988(Res) :- setof((Start,End),next_freestyle_skiing_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = next_freestyle_skiing_at_the_2014_winter_olympics_at_1988'), (next_freestyle_skiing_at_the_2014_winter_olympics_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).

