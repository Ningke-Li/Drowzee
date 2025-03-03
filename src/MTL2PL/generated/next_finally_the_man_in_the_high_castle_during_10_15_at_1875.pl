:- include('database.pl').
the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

finally_the_man_in_the_high_castle_during_10_15(Start,End) :- the_man_in_the_high_castle(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

next_finally_the_man_in_the_high_castle_during_10_15(Start,End) :- finally_the_man_in_the_high_castle_during_10_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_man_in_the_high_castle_during_10_15_at_1875(Res) :- setof((Start,End),next_finally_the_man_in_the_high_castle_during_10_15(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_man_in_the_high_castle_during_10_15_at_1875'), (next_finally_the_man_in_the_high_castle_during_10_15_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

