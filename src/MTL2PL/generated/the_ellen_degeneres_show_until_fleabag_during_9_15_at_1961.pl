:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

fleabag(Start,End) :- begin('fleabag',_,_,Start), end('fleabag',_,_,End), Start=<End.

the_ellen_degeneres_show_last_till_9_15(Start,End) :- the_ellen_degeneres_show(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

the_ellen_degeneres_show_until_fleabag_during_9_15_overlap(Start,End) :- the_ellen_degeneres_show_last_till_9_15(Start1,End1), fleabag(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_ellen_degeneres_show_until_fleabag_during_9_15(Start,End) :- the_ellen_degeneres_show(W1,_), the_ellen_degeneres_show_until_fleabag_during_9_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-9), Start=<End.

the_ellen_degeneres_show_until_fleabag_during_9_15_at_1961(Res) :- setof((Start,End),the_ellen_degeneres_show_until_fleabag_during_9_15(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_until_fleabag_during_9_15_at_1961'), (the_ellen_degeneres_show_until_fleabag_during_9_15_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).

