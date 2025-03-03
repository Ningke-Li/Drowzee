:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

globally_enabling_act_of_1933_during_2_10(Start,End) :- enabling_act_of_1933(Start1,End1), Start is (Start1-2), End is (End1-10), Start=<End.

globally_enabling_act_of_1933_during_2_10_at_1931(Res) :- setof((Start,End),globally_enabling_act_of_1933_during_2_10(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = globally_enabling_act_of_1933_during_2_10_at_1931'), (globally_enabling_act_of_1933_during_2_10_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

