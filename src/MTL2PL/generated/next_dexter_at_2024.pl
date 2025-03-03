:- include('database.pl').
dexter(Start,End) :- begin('dexter',_,_,Start), end('dexter',_,_,End), Start=<End.

next_dexter(Start,End) :- dexter(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_dexter_at_2024(Res) :- setof((Start,End),next_dexter(Start,End),AllINtervals), checkvalidity(2024,AllINtervals,Res).

check_query() :- write('Query = next_dexter_at_2024'), (next_dexter_at_2024(true) -> write('\nRes   = true');write('\nRes   = false')).

