:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

finally_east_german_mark_during_2_12(Start,End) :- east_german_mark(Start1,End1), (Start1-12)=<(End1-2), Start is (Start1-12), End is (End1-2), Start=<End.

finally_east_german_mark_during_2_12_at_1956(Res) :- setof((Start,End),finally_east_german_mark_during_2_12(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = finally_east_german_mark_during_2_12_at_1956'), (finally_east_german_mark_during_2_12_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

