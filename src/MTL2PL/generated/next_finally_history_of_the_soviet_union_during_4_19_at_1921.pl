:- include('database.pl').
history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

finally_history_of_the_soviet_union_during_4_19(Start,End) :- history_of_the_soviet_union(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

next_finally_history_of_the_soviet_union_during_4_19(Start,End) :- finally_history_of_the_soviet_union_during_4_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_history_of_the_soviet_union_during_4_19_at_1921(Res) :- setof((Start,End),next_finally_history_of_the_soviet_union_during_4_19(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_finally_history_of_the_soviet_union_during_4_19_at_1921'), (next_finally_history_of_the_soviet_union_during_4_19_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

