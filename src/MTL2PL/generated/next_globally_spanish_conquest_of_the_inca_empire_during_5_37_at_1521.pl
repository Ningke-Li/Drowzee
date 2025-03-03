:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

globally_spanish_conquest_of_the_inca_empire_during_5_37(Start,End) :- spanish_conquest_of_the_inca_empire(Start1,End1), Start is (Start1-5), End is (End1-37), Start=<End.

next_globally_spanish_conquest_of_the_inca_empire_during_5_37(Start,End) :- globally_spanish_conquest_of_the_inca_empire_during_5_37(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_spanish_conquest_of_the_inca_empire_during_5_37_at_1521(Res) :- setof((Start,End),next_globally_spanish_conquest_of_the_inca_empire_during_5_37(Start,End),AllINtervals), checkvalidity(1521,AllINtervals,Res).

check_query() :- write('Query = next_globally_spanish_conquest_of_the_inca_empire_during_5_37_at_1521'), (next_globally_spanish_conquest_of_the_inca_empire_during_5_37_at_1521(true) -> write('\nRes   = true');write('\nRes   = false')).

