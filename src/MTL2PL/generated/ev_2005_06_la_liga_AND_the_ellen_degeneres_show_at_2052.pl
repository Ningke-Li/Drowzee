:- include('database.pl').
ev_2005_06_la_liga(Start,End) :- begin('ev_2005_06_la_liga',_,_,Start), end('ev_2005_06_la_liga',_,_,End), Start=<End.

the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

generate_facts_ev_2005_06_la_liga_AND_the_ellen_degeneres_show([]) :- assert(ev_2005_06_la_liga_AND_the_ellen_degeneres_show(-1,-1)).

generate_facts_ev_2005_06_la_liga_AND_the_ellen_degeneres_show([(Start,End) | Tail]) :- assert(ev_2005_06_la_liga_AND_the_ellen_degeneres_show(Start,End)), generate_facts_ev_2005_06_la_liga_AND_the_ellen_degeneres_show(Tail).

ev_2005_06_la_liga_AND_the_ellen_degeneres_show_aux() :- findall((Start,End),ev_2005_06_la_liga(Start,End),Interval1), findall((Start,End),the_ellen_degeneres_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2005_06_la_liga_AND_the_ellen_degeneres_show(Interval).

ev_2005_06_la_liga_AND_the_ellen_degeneres_show_at_2052(Res) :- setof((Start,End),ev_2005_06_la_liga_AND_the_ellen_degeneres_show(Start,End),AllINtervals), checkvalidity(2052,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_la_liga_AND_the_ellen_degeneres_show_at_2052'), (ev_2005_06_la_liga_AND_the_ellen_degeneres_show_at_2052(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_la_liga_AND_the_ellen_degeneres_show_aux().

