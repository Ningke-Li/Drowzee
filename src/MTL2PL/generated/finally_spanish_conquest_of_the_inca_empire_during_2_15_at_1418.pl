:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

finally_spanish_conquest_of_the_inca_empire_during_2_15(Start,End) :- spanish_conquest_of_the_inca_empire(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_spanish_conquest_of_the_inca_empire_during_2_15_at_1418(Res) :- setof((Start,End),finally_spanish_conquest_of_the_inca_empire_during_2_15(Start,End),AllINtervals), checkvalidity(1418,AllINtervals,Res).

check_query() :- write('Query = finally_spanish_conquest_of_the_inca_empire_during_2_15_at_1418'), (finally_spanish_conquest_of_the_inca_empire_during_2_15_at_1418(true) -> write('\nRes   = true');write('\nRes   = false')).

