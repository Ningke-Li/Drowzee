:- include('database.pl').
second_intifada(Start,End) :- begin('second_intifada',_,_,Start), end('second_intifada',_,_,End), Start=<End.

next_second_intifada(Start,End) :- second_intifada(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_second_intifada_at_1999(Res) :- setof((Start,End),next_second_intifada(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = next_second_intifada_at_1999'), (next_second_intifada_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

