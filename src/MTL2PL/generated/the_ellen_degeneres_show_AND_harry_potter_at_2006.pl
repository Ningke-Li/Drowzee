:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

generate_facts_the_ellen_degeneres_show_AND_harry_potter([]) :- assert(the_ellen_degeneres_show_AND_harry_potter(-1,-1)).

generate_facts_the_ellen_degeneres_show_AND_harry_potter([(Start,End) | Tail]) :- assert(the_ellen_degeneres_show_AND_harry_potter(Start,End)), generate_facts_the_ellen_degeneres_show_AND_harry_potter(Tail).

the_ellen_degeneres_show_AND_harry_potter_aux() :- findall((Start,End),the_ellen_degeneres_show(Start,End),Interval1), findall((Start,End),harry_potter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_ellen_degeneres_show_AND_harry_potter(Interval).

the_ellen_degeneres_show_AND_harry_potter_at_2006(Res) :- setof((Start,End),the_ellen_degeneres_show_AND_harry_potter(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_AND_harry_potter_at_2006'), (the_ellen_degeneres_show_AND_harry_potter_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_ellen_degeneres_show_AND_harry_potter_aux().

