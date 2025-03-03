:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

finally_dora_the_explorer_during_3_11(Start,End) :- dora_the_explorer(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

finally_dora_the_explorer_during_3_11_at_1998(Res) :- setof((Start,End),finally_dora_the_explorer_during_3_11(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = finally_dora_the_explorer_during_3_11_at_1998'), (finally_dora_the_explorer_during_3_11_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

