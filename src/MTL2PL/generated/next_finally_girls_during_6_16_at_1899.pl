:- include('database.pl').
girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

finally_girls_during_6_16(Start,End) :- girls(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

next_finally_girls_during_6_16(Start,End) :- finally_girls_during_6_16(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_girls_during_6_16_at_1899(Res) :- setof((Start,End),next_finally_girls_during_6_16(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = next_finally_girls_during_6_16_at_1899'), (next_finally_girls_during_6_16_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

