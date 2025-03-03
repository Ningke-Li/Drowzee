:- include('database.pl').
rococo(Start,End) :- begin('rococo',_,_,Start), end('rococo',_,_,End), Start=<End.

finally_rococo_during_9_17(Start,End) :- rococo(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_rococo_during_9_17_at_1819(Res) :- setof((Start,End),finally_rococo_during_9_17(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = finally_rococo_during_9_17_at_1819'), (finally_rococo_during_9_17_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).

