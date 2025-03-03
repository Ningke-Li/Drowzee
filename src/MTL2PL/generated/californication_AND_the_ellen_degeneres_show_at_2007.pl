:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

generate_facts_californication_AND_the_ellen_degeneres_show([]) :- assert(californication_AND_the_ellen_degeneres_show(-1,-1)).

generate_facts_californication_AND_the_ellen_degeneres_show([(Start,End) | Tail]) :- assert(californication_AND_the_ellen_degeneres_show(Start,End)), generate_facts_californication_AND_the_ellen_degeneres_show(Tail).

californication_AND_the_ellen_degeneres_show_aux() :- findall((Start,End),californication(Start,End),Interval1), findall((Start,End),the_ellen_degeneres_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_californication_AND_the_ellen_degeneres_show(Interval).

californication_AND_the_ellen_degeneres_show_at_2007(Res) :- setof((Start,End),californication_AND_the_ellen_degeneres_show(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = californication_AND_the_ellen_degeneres_show_at_2007'), (californication_AND_the_ellen_degeneres_show_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- californication_AND_the_ellen_degeneres_show_aux().

