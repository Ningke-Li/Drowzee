:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

generate_facts_the_ellen_degeneres_show_AND_ev_2015_16_la_liga([]) :- assert(the_ellen_degeneres_show_AND_ev_2015_16_la_liga(-1,-1)).

generate_facts_the_ellen_degeneres_show_AND_ev_2015_16_la_liga([(Start,End) | Tail]) :- assert(the_ellen_degeneres_show_AND_ev_2015_16_la_liga(Start,End)), generate_facts_the_ellen_degeneres_show_AND_ev_2015_16_la_liga(Tail).

the_ellen_degeneres_show_AND_ev_2015_16_la_liga_aux() :- findall((Start,End),the_ellen_degeneres_show(Start,End),Interval1), findall((Start,End),ev_2015_16_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_ellen_degeneres_show_AND_ev_2015_16_la_liga(Interval).

the_ellen_degeneres_show_AND_ev_2015_16_la_liga_at_1959(Res) :- setof((Start,End),the_ellen_degeneres_show_AND_ev_2015_16_la_liga(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_AND_ev_2015_16_la_liga_at_1959'), (the_ellen_degeneres_show_AND_ev_2015_16_la_liga_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_ellen_degeneres_show_AND_ev_2015_16_la_liga_aux().

