:- include('database.pl').
avenida_brasil(Start,End) :- begin('avenida_brasil',_,_,Start), end('avenida_brasil',_,_,End), Start=<End.

next_avenida_brasil(Start,End) :- avenida_brasil(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_avenida_brasil_at_1865(Res) :- setof((Start,End),next_avenida_brasil(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = next_avenida_brasil_at_1865'), (next_avenida_brasil_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

