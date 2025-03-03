:- include('database.pl').
numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

globally_numbers_during_3_5(Start,End) :- numbers(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

finally_globally_numbers_during_3_5_during_3_13(Start,End) :- globally_numbers_during_3_5(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

finally_globally_numbers_during_3_5_during_3_13_at_1996(Res) :- setof((Start,End),finally_globally_numbers_during_3_5_during_3_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_globally_numbers_during_3_5_during_3_13_at_1996'), (finally_globally_numbers_during_3_5_during_3_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

