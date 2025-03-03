:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

next_enabling_act_of_1933(Start,End) :- enabling_act_of_1933(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_enabling_act_of_1933_at_1849(Res) :- setof((Start,End),next_enabling_act_of_1933(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = next_enabling_act_of_1933_at_1849'), (next_enabling_act_of_1933_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).

