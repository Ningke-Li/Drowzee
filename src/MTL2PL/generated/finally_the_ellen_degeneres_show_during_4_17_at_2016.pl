:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

finally_the_ellen_degeneres_show_during_4_17(Start,End) :- the_ellen_degeneres_show(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_the_ellen_degeneres_show_during_4_17_at_2016(Res) :- setof((Start,End),finally_the_ellen_degeneres_show_during_4_17(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = finally_the_ellen_degeneres_show_during_4_17_at_2016'), (finally_the_ellen_degeneres_show_during_4_17_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

