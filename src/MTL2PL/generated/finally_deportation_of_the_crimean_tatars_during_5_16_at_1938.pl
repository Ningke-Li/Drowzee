:- include('database.pl').
deportation_of_the_crimean_tatars(Start,End) :- begin('deportation_of_the_crimean_tatars',_,_,Start), end('deportation_of_the_crimean_tatars',_,_,End), Start=<End.

finally_deportation_of_the_crimean_tatars_during_5_16(Start,End) :- deportation_of_the_crimean_tatars(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

finally_deportation_of_the_crimean_tatars_during_5_16_at_1938(Res) :- setof((Start,End),finally_deportation_of_the_crimean_tatars_during_5_16(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = finally_deportation_of_the_crimean_tatars_during_5_16_at_1938'), (finally_deportation_of_the_crimean_tatars_during_5_16_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

