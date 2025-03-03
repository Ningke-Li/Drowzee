:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

finally_the_x_factor_during_6_11(Start,End) :- the_x_factor(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

finally_the_x_factor_during_6_11_at_1964(Res) :- setof((Start,End),finally_the_x_factor_during_6_11(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = finally_the_x_factor_during_6_11_at_1964'), (finally_the_x_factor_during_6_11_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).

