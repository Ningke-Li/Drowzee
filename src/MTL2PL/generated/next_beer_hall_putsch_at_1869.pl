:- include('database.pl').
beer_hall_putsch(Start,End) :- begin('beer_hall_putsch',_,_,Start), end('beer_hall_putsch',_,_,End), Start=<End.

next_beer_hall_putsch(Start,End) :- beer_hall_putsch(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_beer_hall_putsch_at_1869(Res) :- setof((Start,End),next_beer_hall_putsch(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = next_beer_hall_putsch_at_1869'), (next_beer_hall_putsch_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

