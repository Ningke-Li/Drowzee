:- include('database.pl').
operation_dragoon(Start,End) :- begin('operation_dragoon',_,_,Start), end('operation_dragoon',_,_,End), Start=<End.

finally_operation_dragoon_during_4_20(Start,End) :- operation_dragoon(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_operation_dragoon_during_4_20_at_1870(Res) :- setof((Start,End),finally_operation_dragoon_during_4_20(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = finally_operation_dragoon_during_4_20_at_1870'), (finally_operation_dragoon_during_4_20_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).

