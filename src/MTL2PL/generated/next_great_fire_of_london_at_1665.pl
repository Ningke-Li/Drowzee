:- include('database.pl').
great_fire_of_london(Start,End) :- begin('great_fire_of_london',_,_,Start), end('great_fire_of_london',_,_,End), Start=<End.

next_great_fire_of_london(Start,End) :- great_fire_of_london(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_great_fire_of_london_at_1665(Res) :- setof((Start,End),next_great_fire_of_london(Start,End),AllINtervals), checkvalidity(1665,AllINtervals,Res).

check_query() :- write('Query = next_great_fire_of_london_at_1665'), (next_great_fire_of_london_at_1665(true) -> write('\nRes   = true');write('\nRes   = false')).

