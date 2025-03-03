:- include('database.pl').
spanish_colonization_of_the_americas(Start,End) :- begin('spanish_colonization_of_the_americas',_,_,Start), end('spanish_colonization_of_the_americas',_,_,End), Start=<End.

finally_spanish_colonization_of_the_americas_during_10_13(Start,End) :- spanish_colonization_of_the_americas(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

finally_spanish_colonization_of_the_americas_during_10_13_at_1497(Res) :- setof((Start,End),finally_spanish_colonization_of_the_americas_during_10_13(Start,End),AllINtervals), checkvalidity(1497,AllINtervals,Res).

check_query() :- write('Query = finally_spanish_colonization_of_the_americas_during_10_13_at_1497'), (finally_spanish_colonization_of_the_americas_during_10_13_at_1497(true) -> write('\nRes   = true');write('\nRes   = false')).

