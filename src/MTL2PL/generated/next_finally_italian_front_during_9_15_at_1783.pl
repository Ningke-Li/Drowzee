:- include('database.pl').
italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

finally_italian_front_during_9_15(Start,End) :- italian_front(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

next_finally_italian_front_during_9_15(Start,End) :- finally_italian_front_during_9_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_italian_front_during_9_15_at_1783(Res) :- setof((Start,End),next_finally_italian_front_during_9_15(Start,End),AllINtervals), checkvalidity(1783,AllINtervals,Res).

check_query() :- write('Query = next_finally_italian_front_during_9_15_at_1783'), (next_finally_italian_front_during_9_15_at_1783(true) -> write('\nRes   = true');write('\nRes   = false')).

