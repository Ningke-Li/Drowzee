:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

finally_ncis__new_orleans_during_8_15(Start,End) :- ncis__new_orleans(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

next_finally_ncis__new_orleans_during_8_15(Start,End) :- finally_ncis__new_orleans_during_8_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_ncis__new_orleans_during_8_15_at_1935(Res) :- setof((Start,End),next_finally_ncis__new_orleans_during_8_15(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = next_finally_ncis__new_orleans_during_8_15_at_1935'), (next_finally_ncis__new_orleans_during_8_15_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

