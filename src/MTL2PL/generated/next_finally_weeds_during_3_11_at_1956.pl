:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

finally_weeds_during_3_11(Start,End) :- weeds(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

next_finally_weeds_during_3_11(Start,End) :- finally_weeds_during_3_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_weeds_during_3_11_at_1956(Res) :- setof((Start,End),next_finally_weeds_during_3_11(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = next_finally_weeds_during_3_11_at_1956'), (next_finally_weeds_during_3_11_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

