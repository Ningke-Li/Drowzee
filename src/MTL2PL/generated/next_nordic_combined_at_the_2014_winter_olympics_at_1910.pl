:- include('database.pl').
nordic_combined_at_the_2014_winter_olympics(Start,End) :- begin('nordic_combined_at_the_2014_winter_olympics',_,_,Start), end('nordic_combined_at_the_2014_winter_olympics',_,_,End), Start=<End.

next_nordic_combined_at_the_2014_winter_olympics(Start,End) :- nordic_combined_at_the_2014_winter_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_nordic_combined_at_the_2014_winter_olympics_at_1910(Res) :- setof((Start,End),next_nordic_combined_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = next_nordic_combined_at_the_2014_winter_olympics_at_1910'), (next_nordic_combined_at_the_2014_winter_olympics_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).

