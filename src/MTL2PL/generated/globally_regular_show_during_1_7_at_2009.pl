:- include('database.pl').
regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

globally_regular_show_during_1_7(Start,End) :- regular_show(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

globally_regular_show_during_1_7_at_2009(Res) :- setof((Start,End),globally_regular_show_during_1_7(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = globally_regular_show_during_1_7_at_2009'), (globally_regular_show_during_1_7_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

