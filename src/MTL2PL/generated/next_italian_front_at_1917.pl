:- include('database.pl').
italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

next_italian_front(Start,End) :- italian_front(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_italian_front_at_1917(Res) :- setof((Start,End),next_italian_front(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_italian_front_at_1917'), (next_italian_front_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

