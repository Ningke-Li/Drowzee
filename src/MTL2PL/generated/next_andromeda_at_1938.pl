:- include('database.pl').
andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

next_andromeda(Start,End) :- andromeda(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_andromeda_at_1938(Res) :- setof((Start,End),next_andromeda(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = next_andromeda_at_1938'), (next_andromeda_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

