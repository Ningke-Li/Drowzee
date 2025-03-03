:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

kyle_xy(Start,End) :- begin('kyle_xy',_,_,Start), end('kyle_xy',_,_,End), Start=<End.

generate_facts_the_ellen_degeneres_show_AND_kyle_xy([]) :- assert(the_ellen_degeneres_show_AND_kyle_xy(-1,-1)).

generate_facts_the_ellen_degeneres_show_AND_kyle_xy([(Start,End) | Tail]) :- assert(the_ellen_degeneres_show_AND_kyle_xy(Start,End)), generate_facts_the_ellen_degeneres_show_AND_kyle_xy(Tail).

the_ellen_degeneres_show_AND_kyle_xy_aux() :- findall((Start,End),the_ellen_degeneres_show(Start,End),Interval1), findall((Start,End),kyle_xy(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_ellen_degeneres_show_AND_kyle_xy(Interval).

the_ellen_degeneres_show_AND_kyle_xy_at_1858(Res) :- setof((Start,End),the_ellen_degeneres_show_AND_kyle_xy(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_AND_kyle_xy_at_1858'), (the_ellen_degeneres_show_AND_kyle_xy_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_ellen_degeneres_show_AND_kyle_xy_aux().

