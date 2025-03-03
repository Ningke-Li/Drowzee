:- include('database.pl').
the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

next_the_man_in_the_high_castle(Start,End) :- the_man_in_the_high_castle(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_man_in_the_high_castle_at_1929(Res) :- setof((Start,End),next_the_man_in_the_high_castle(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = next_the_man_in_the_high_castle_at_1929'), (next_the_man_in_the_high_castle_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

