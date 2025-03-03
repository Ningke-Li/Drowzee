:- include('database.pl').
the_cleveland_show(Start,End) :- begin('the_cleveland_show',_,_,Start), end('the_cleveland_show',_,_,End), Start=<End.

finally_the_cleveland_show_during_10_19(Start,End) :- the_cleveland_show(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

next_finally_the_cleveland_show_during_10_19(Start,End) :- finally_the_cleveland_show_during_10_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_cleveland_show_during_10_19_at_2000(Res) :- setof((Start,End),next_finally_the_cleveland_show_during_10_19(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_cleveland_show_during_10_19_at_2000'), (next_finally_the_cleveland_show_during_10_19_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

