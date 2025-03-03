:- include('database.pl').
uefa_euro_2012_group_b(Start,End) :- begin('uefa_euro_2012_group_b',_,_,Start), end('uefa_euro_2012_group_b',_,_,End), Start=<End.

next_uefa_euro_2012_group_b(Start,End) :- uefa_euro_2012_group_b(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_uefa_euro_2012_group_b_at_1872(Res) :- setof((Start,End),next_uefa_euro_2012_group_b(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = next_uefa_euro_2012_group_b_at_1872'), (next_uefa_euro_2012_group_b_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).

