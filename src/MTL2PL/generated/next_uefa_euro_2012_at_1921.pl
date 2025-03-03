:- include('database.pl').
uefa_euro_2012(Start,End) :- begin('uefa_euro_2012',_,_,Start), end('uefa_euro_2012',_,_,End), Start=<End.

next_uefa_euro_2012(Start,End) :- uefa_euro_2012(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_uefa_euro_2012_at_1921(Res) :- setof((Start,End),next_uefa_euro_2012(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_uefa_euro_2012_at_1921'), (next_uefa_euro_2012_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

