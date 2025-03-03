:- include('database.pl').
second_intifada(Start,End) :- begin('second_intifada',_,_,Start), end('second_intifada',_,_,End), Start=<End.

finally_second_intifada_during_4_14(Start,End) :- second_intifada(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

next_finally_second_intifada_during_4_14(Start,End) :- finally_second_intifada_during_4_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_second_intifada_during_4_14_at_1992(Res) :- setof((Start,End),next_finally_second_intifada_during_4_14(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = next_finally_second_intifada_during_4_14_at_1992'), (next_finally_second_intifada_during_4_14_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

