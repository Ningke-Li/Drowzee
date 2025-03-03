:- include('database.pl').
second_spanish_republic(Start,End) :- begin('second_spanish_republic',_,_,Start), end('second_spanish_republic',_,_,End), Start=<End.

finally_second_spanish_republic_during_2_19(Start,End) :- second_spanish_republic(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_second_spanish_republic_during_2_19_at_1916(Res) :- setof((Start,End),finally_second_spanish_republic_during_2_19(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = finally_second_spanish_republic_during_2_19_at_1916'), (finally_second_spanish_republic_during_2_19_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).

