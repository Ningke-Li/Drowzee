:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

finally_sultanate_of_women_during_10_15(Start,End) :- sultanate_of_women(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

next_finally_sultanate_of_women_during_10_15(Start,End) :- finally_sultanate_of_women_during_10_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_sultanate_of_women_during_10_15_at_1409(Res) :- setof((Start,End),next_finally_sultanate_of_women_during_10_15(Start,End),AllINtervals), checkvalidity(1409,AllINtervals,Res).

check_query() :- write('Query = next_finally_sultanate_of_women_during_10_15_at_1409'), (next_finally_sultanate_of_women_during_10_15_at_1409(true) -> write('\nRes   = true');write('\nRes   = false')).

