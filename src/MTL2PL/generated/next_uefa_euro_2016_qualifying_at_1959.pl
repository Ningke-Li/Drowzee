:- include('database.pl').
uefa_euro_2016_qualifying(Start,End) :- begin('uefa_euro_2016_qualifying',_,_,Start), end('uefa_euro_2016_qualifying',_,_,End), Start=<End.

next_uefa_euro_2016_qualifying(Start,End) :- uefa_euro_2016_qualifying(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_uefa_euro_2016_qualifying_at_1959(Res) :- setof((Start,End),next_uefa_euro_2016_qualifying(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = next_uefa_euro_2016_qualifying_at_1959'), (next_uefa_euro_2016_qualifying_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

