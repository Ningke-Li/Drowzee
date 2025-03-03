:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

finally_jean_antoine_watteau_during_9_13(Start,End) :- jean_antoine_watteau(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_jean_antoine_watteau_during_9_13_at_1597(Res) :- setof((Start,End),finally_jean_antoine_watteau_during_9_13(Start,End),AllINtervals), checkvalidity(1597,AllINtervals,Res).

check_query() :- write('Query = finally_jean_antoine_watteau_during_9_13_at_1597'), (finally_jean_antoine_watteau_during_9_13_at_1597(true) -> write('\nRes   = true');write('\nRes   = false')).

