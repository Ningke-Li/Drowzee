:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

globally_spanish_conquest_of_the_inca_empire_during_6_40(Start,End) :- spanish_conquest_of_the_inca_empire(Start1,End1), Start is (Start1-6), End is (End1-40), Start=<End.

finally_globally_spanish_conquest_of_the_inca_empire_during_6_40_during_5_20(Start,End) :- globally_spanish_conquest_of_the_inca_empire_during_6_40(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_globally_spanish_conquest_of_the_inca_empire_during_6_40_during_5_20_at_1510(Res) :- setof((Start,End),finally_globally_spanish_conquest_of_the_inca_empire_during_6_40_during_5_20(Start,End),AllINtervals), checkvalidity(1510,AllINtervals,Res).

check_query() :- write('Query = finally_globally_spanish_conquest_of_the_inca_empire_during_6_40_during_5_20_at_1510'), (finally_globally_spanish_conquest_of_the_inca_empire_during_6_40_during_5_20_at_1510(true) -> write('\nRes   = true');write('\nRes   = false')).

