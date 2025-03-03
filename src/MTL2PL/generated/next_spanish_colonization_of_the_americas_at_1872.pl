:- include('database.pl').
spanish_colonization_of_the_americas(Start,End) :- begin('spanish_colonization_of_the_americas',_,_,Start), end('spanish_colonization_of_the_americas',_,_,End), Start=<End.

next_spanish_colonization_of_the_americas(Start,End) :- spanish_colonization_of_the_americas(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_spanish_colonization_of_the_americas_at_1872(Res) :- setof((Start,End),next_spanish_colonization_of_the_americas(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = next_spanish_colonization_of_the_americas_at_1872'), (next_spanish_colonization_of_the_americas_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).

