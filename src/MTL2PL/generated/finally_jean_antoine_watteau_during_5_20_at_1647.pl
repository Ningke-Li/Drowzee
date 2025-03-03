:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

finally_jean_antoine_watteau_during_5_20(Start,End) :- jean_antoine_watteau(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_jean_antoine_watteau_during_5_20_at_1647(Res) :- setof((Start,End),finally_jean_antoine_watteau_during_5_20(Start,End),AllINtervals), checkvalidity(1647,AllINtervals,Res).

check_query() :- write('Query = finally_jean_antoine_watteau_during_5_20_at_1647'), (finally_jean_antoine_watteau_during_5_20_at_1647(true) -> write('\nRes   = true');write('\nRes   = false')).

