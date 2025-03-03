:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

finally_spanish_conquest_of_the_inca_empire_during_1_14(Start,End) :- spanish_conquest_of_the_inca_empire(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

globally_finally_spanish_conquest_of_the_inca_empire_during_1_14_during_36_40(Start,End) :- finally_spanish_conquest_of_the_inca_empire_during_1_14(Start1,End1), Start is (Start1-36), End is (End1-40), Start=<End.

globally_finally_spanish_conquest_of_the_inca_empire_during_1_14_during_36_40_at_1489(Res) :- setof((Start,End),globally_finally_spanish_conquest_of_the_inca_empire_during_1_14_during_36_40(Start,End),AllINtervals), checkvalidity(1489,AllINtervals,Res).

check_query() :- write('Query = globally_finally_spanish_conquest_of_the_inca_empire_during_1_14_during_36_40_at_1489'), (globally_finally_spanish_conquest_of_the_inca_empire_during_1_14_during_36_40_at_1489(true) -> write('\nRes   = true');write('\nRes   = false')).

