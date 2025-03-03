:- include('database.pl').
orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

finally_orange_is_the_new_black_during_9_15(Start,End) :- orange_is_the_new_black(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

finally_orange_is_the_new_black_during_9_15_at_1912(Res) :- setof((Start,End),finally_orange_is_the_new_black_during_9_15(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = finally_orange_is_the_new_black_during_9_15_at_1912'), (finally_orange_is_the_new_black_during_9_15_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

