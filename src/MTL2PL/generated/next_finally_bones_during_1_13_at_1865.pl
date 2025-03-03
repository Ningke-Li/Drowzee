:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

finally_bones_during_1_13(Start,End) :- bones(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

next_finally_bones_during_1_13(Start,End) :- finally_bones_during_1_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_bones_during_1_13_at_1865(Res) :- setof((Start,End),next_finally_bones_during_1_13(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = next_finally_bones_during_1_13_at_1865'), (next_finally_bones_during_1_13_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

