:- include('database.pl').
bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

generate_facts_bojack_horseman_AND_the_ellen_degeneres_show([]) :- assert(bojack_horseman_AND_the_ellen_degeneres_show(-1,-1)).

generate_facts_bojack_horseman_AND_the_ellen_degeneres_show([(Start,End) | Tail]) :- assert(bojack_horseman_AND_the_ellen_degeneres_show(Start,End)), generate_facts_bojack_horseman_AND_the_ellen_degeneres_show(Tail).

bojack_horseman_AND_the_ellen_degeneres_show_aux() :- findall((Start,End),bojack_horseman(Start,End),Interval1), findall((Start,End),the_ellen_degeneres_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bojack_horseman_AND_the_ellen_degeneres_show(Interval).

bojack_horseman_AND_the_ellen_degeneres_show_at_2014(Res) :- setof((Start,End),bojack_horseman_AND_the_ellen_degeneres_show(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = bojack_horseman_AND_the_ellen_degeneres_show_at_2014'), (bojack_horseman_AND_the_ellen_degeneres_show_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bojack_horseman_AND_the_ellen_degeneres_show_aux().

