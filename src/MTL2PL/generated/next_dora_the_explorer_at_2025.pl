:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

next_dora_the_explorer(Start,End) :- dora_the_explorer(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_dora_the_explorer_at_2025(Res) :- setof((Start,End),next_dora_the_explorer(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = next_dora_the_explorer_at_2025'), (next_dora_the_explorer_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).

