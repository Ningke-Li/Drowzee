:- include('database.pl').
the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

globally_the_man_in_the_high_castle_during_1_3(Start,End) :- the_man_in_the_high_castle(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_the_man_in_the_high_castle_during_1_3_during_2_13(Start,End) :- globally_the_man_in_the_high_castle_during_1_3(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_globally_the_man_in_the_high_castle_during_1_3_during_2_13_at_2022(Res) :- setof((Start,End),finally_globally_the_man_in_the_high_castle_during_1_3_during_2_13(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = finally_globally_the_man_in_the_high_castle_during_1_3_during_2_13_at_2022'), (finally_globally_the_man_in_the_high_castle_during_1_3_during_2_13_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).

