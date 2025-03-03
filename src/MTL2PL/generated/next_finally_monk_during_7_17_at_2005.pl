:- include('database.pl').
monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

finally_monk_during_7_17(Start,End) :- monk(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

next_finally_monk_during_7_17(Start,End) :- finally_monk_during_7_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_monk_during_7_17_at_2005(Res) :- setof((Start,End),next_finally_monk_during_7_17(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = next_finally_monk_during_7_17_at_2005'), (next_finally_monk_during_7_17_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

