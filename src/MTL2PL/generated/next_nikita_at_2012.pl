:- include('database.pl').
nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

next_nikita(Start,End) :- nikita(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_nikita_at_2012(Res) :- setof((Start,End),next_nikita(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_nikita_at_2012'), (next_nikita_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

