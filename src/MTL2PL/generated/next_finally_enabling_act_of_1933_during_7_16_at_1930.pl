:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

finally_enabling_act_of_1933_during_7_16(Start,End) :- enabling_act_of_1933(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

next_finally_enabling_act_of_1933_during_7_16(Start,End) :- finally_enabling_act_of_1933_during_7_16(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_enabling_act_of_1933_during_7_16_at_1930(Res) :- setof((Start,End),next_finally_enabling_act_of_1933_during_7_16(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = next_finally_enabling_act_of_1933_during_7_16_at_1930'), (next_finally_enabling_act_of_1933_during_7_16_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

