:- include('database.pl').
the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

finally_the_good_place_during_9_15(Start,End) :- the_good_place(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

finally_the_good_place_during_9_15_at_2009(Res) :- setof((Start,End),finally_the_good_place_during_9_15(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = finally_the_good_place_during_9_15_at_2009'), (finally_the_good_place_during_9_15_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

