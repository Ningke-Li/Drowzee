:- include('database.pl').
descendants_of_the_sun(Start,End) :- begin('descendants_of_the_sun',_,_,Start), end('descendants_of_the_sun',_,_,End), Start=<End.

next_descendants_of_the_sun(Start,End) :- descendants_of_the_sun(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_descendants_of_the_sun_at_1937(Res) :- setof((Start,End),next_descendants_of_the_sun(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = next_descendants_of_the_sun_at_1937'), (next_descendants_of_the_sun_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

