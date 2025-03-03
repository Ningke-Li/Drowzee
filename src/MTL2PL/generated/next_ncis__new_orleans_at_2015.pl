:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

next_ncis__new_orleans(Start,End) :- ncis__new_orleans(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ncis__new_orleans_at_2015(Res) :- setof((Start,End),next_ncis__new_orleans(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_ncis__new_orleans_at_2015'), (next_ncis__new_orleans_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

