:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

finally_the_ellen_degeneres_show_during_8_11(Start,End) :- the_ellen_degeneres_show(Start1,End1), (Start1-11)=<(End1-8), Start is (Start1-11), End is (End1-8), Start=<End.

finally_the_ellen_degeneres_show_during_8_11_at_1868(Res) :- setof((Start,End),finally_the_ellen_degeneres_show_during_8_11(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = finally_the_ellen_degeneres_show_during_8_11_at_1868'), (finally_the_ellen_degeneres_show_during_8_11_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).

