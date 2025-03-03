:- include('database.pl').
rub_(Start,End) :- begin('rub_',_,_,Start), end('rub_',_,_,End), Start=<End.

next_rub_(Start,End) :- rub_(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_rub__at_1861(Res) :- setof((Start,End),next_rub_(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = next_rub__at_1861'), (next_rub__at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

