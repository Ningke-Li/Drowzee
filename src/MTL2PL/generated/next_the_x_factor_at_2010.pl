:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

next_the_x_factor(Start,End) :- the_x_factor(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_x_factor_at_2010(Res) :- setof((Start,End),next_the_x_factor(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_the_x_factor_at_2010'), (next_the_x_factor_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

