:- include('database.pl').
jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

generate_facts_jonas_AND_the_ellen_degeneres_show([]) :- assert(jonas_AND_the_ellen_degeneres_show(-1,-1)).

generate_facts_jonas_AND_the_ellen_degeneres_show([(Start,End) | Tail]) :- assert(jonas_AND_the_ellen_degeneres_show(Start,End)), generate_facts_jonas_AND_the_ellen_degeneres_show(Tail).

jonas_AND_the_ellen_degeneres_show_aux() :- findall((Start,End),jonas(Start,End),Interval1), findall((Start,End),the_ellen_degeneres_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jonas_AND_the_ellen_degeneres_show(Interval).

jonas_AND_the_ellen_degeneres_show_at_2010(Res) :- setof((Start,End),jonas_AND_the_ellen_degeneres_show(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = jonas_AND_the_ellen_degeneres_show_at_2010'), (jonas_AND_the_ellen_degeneres_show_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jonas_AND_the_ellen_degeneres_show_aux().

