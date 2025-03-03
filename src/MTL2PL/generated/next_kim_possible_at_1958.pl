:- include('database.pl').
kim_possible(Start,End) :- begin('kim_possible',_,_,Start), end('kim_possible',_,_,End), Start=<End.

next_kim_possible(Start,End) :- kim_possible(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_kim_possible_at_1958(Res) :- setof((Start,End),next_kim_possible(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = next_kim_possible_at_1958'), (next_kim_possible_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).

