:- include('database.pl').
german_mark(Start,End) :- begin('german_mark',_,_,Start), end('german_mark',_,_,End), Start=<End.

finally_german_mark_during_8_20(Start,End) :- german_mark(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

finally_german_mark_during_8_20_at_1849(Res) :- setof((Start,End),finally_german_mark_during_8_20(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = finally_german_mark_during_8_20_at_1849'), (finally_german_mark_during_8_20_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).

