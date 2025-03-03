:- include('database.pl').
johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

finally_johnny_test_during_7_11(Start,End) :- johnny_test(Start1,End1), (Start1-11)=<(End1-7), Start is (Start1-11), End is (End1-7), Start=<End.

finally_johnny_test_during_7_11_at_1997(Res) :- setof((Start,End),finally_johnny_test_during_7_11(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_johnny_test_during_7_11_at_1997'), (finally_johnny_test_during_7_11_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

