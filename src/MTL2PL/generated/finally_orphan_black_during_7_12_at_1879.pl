:- include('database.pl').
orphan_black(Start,End) :- begin('orphan_black',_,_,Start), end('orphan_black',_,_,End), Start=<End.

finally_orphan_black_during_7_12(Start,End) :- orphan_black(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

finally_orphan_black_during_7_12_at_1879(Res) :- setof((Start,End),finally_orphan_black_during_7_12(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = finally_orphan_black_during_7_12_at_1879'), (finally_orphan_black_during_7_12_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).

