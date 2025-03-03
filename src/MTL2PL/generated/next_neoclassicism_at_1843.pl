:- include('database.pl').
neoclassicism(Start,End) :- begin('neoclassicism',_,_,Start), end('neoclassicism',_,_,End), Start=<End.

next_neoclassicism(Start,End) :- neoclassicism(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_neoclassicism_at_1843(Res) :- setof((Start,End),next_neoclassicism(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = next_neoclassicism_at_1843'), (next_neoclassicism_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).

