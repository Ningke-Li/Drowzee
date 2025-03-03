:- include('database.pl').
the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

finally_the_good_place_during_6_13(Start,End) :- the_good_place(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

next_finally_the_good_place_during_6_13(Start,End) :- finally_the_good_place_during_6_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_good_place_during_6_13_at_2011(Res) :- setof((Start,End),next_finally_the_good_place_during_6_13(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_good_place_during_6_13_at_2011'), (next_finally_the_good_place_during_6_13_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

