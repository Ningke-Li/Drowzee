:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

carrossel(Start,End) :- begin('carrossel',_,_,Start), end('carrossel',_,_,End), Start=<End.

the_ellen_degeneres_show_last_till_5_9(Start,End) :- the_ellen_degeneres_show(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

the_ellen_degeneres_show_until_carrossel_during_5_9_overlap(Start,End) :- the_ellen_degeneres_show_last_till_5_9(Start1,End1), carrossel(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_ellen_degeneres_show_until_carrossel_during_5_9(Start,End) :- the_ellen_degeneres_show(W1,_), the_ellen_degeneres_show_until_carrossel_during_5_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-5), Start=<End.

the_ellen_degeneres_show_until_carrossel_during_5_9_at_1996(Res) :- setof((Start,End),the_ellen_degeneres_show_until_carrossel_during_5_9(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_until_carrossel_during_5_9_at_1996'), (the_ellen_degeneres_show_until_carrossel_during_5_9_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

