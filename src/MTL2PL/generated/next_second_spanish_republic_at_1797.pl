:- include('database.pl').
second_spanish_republic(Start,End) :- begin('second_spanish_republic',_,_,Start), end('second_spanish_republic',_,_,End), Start=<End.

next_second_spanish_republic(Start,End) :- second_spanish_republic(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_second_spanish_republic_at_1797(Res) :- setof((Start,End),next_second_spanish_republic(Start,End),AllINtervals), checkvalidity(1797,AllINtervals,Res).

check_query() :- write('Query = next_second_spanish_republic_at_1797'), (next_second_spanish_republic_at_1797(true) -> write('\nRes   = true');write('\nRes   = false')).

