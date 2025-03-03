:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

finally_entourage_during_3_20(Start,End) :- entourage(Start1,End1), (Start1-20)=<(End1-3), Start is (Start1-20), End is (End1-3), Start=<End.

globally_finally_entourage_during_3_20_during_9_15(Start,End) :- finally_entourage_during_3_20(Start1,End1), Start is (Start1-9), End is (End1-15), Start=<End.

globally_finally_entourage_during_3_20_during_9_15_at_1840(Res) :- setof((Start,End),globally_finally_entourage_during_3_20_during_9_15(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = globally_finally_entourage_during_3_20_during_9_15_at_1840'), (globally_finally_entourage_during_3_20_during_9_15_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).

