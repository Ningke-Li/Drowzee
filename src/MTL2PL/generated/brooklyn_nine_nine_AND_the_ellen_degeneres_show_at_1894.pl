:- include('database.pl').
brooklyn_nine_nine(Start,End) :- begin('brooklyn_nine_nine',_,_,Start), end('brooklyn_nine_nine',_,_,End), Start=<End.

the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

generate_facts_brooklyn_nine_nine_AND_the_ellen_degeneres_show([]) :- assert(brooklyn_nine_nine_AND_the_ellen_degeneres_show(-1,-1)).

generate_facts_brooklyn_nine_nine_AND_the_ellen_degeneres_show([(Start,End) | Tail]) :- assert(brooklyn_nine_nine_AND_the_ellen_degeneres_show(Start,End)), generate_facts_brooklyn_nine_nine_AND_the_ellen_degeneres_show(Tail).

brooklyn_nine_nine_AND_the_ellen_degeneres_show_aux() :- findall((Start,End),brooklyn_nine_nine(Start,End),Interval1), findall((Start,End),the_ellen_degeneres_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_brooklyn_nine_nine_AND_the_ellen_degeneres_show(Interval).

brooklyn_nine_nine_AND_the_ellen_degeneres_show_at_1894(Res) :- setof((Start,End),brooklyn_nine_nine_AND_the_ellen_degeneres_show(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = brooklyn_nine_nine_AND_the_ellen_degeneres_show_at_1894'), (brooklyn_nine_nine_AND_the_ellen_degeneres_show_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brooklyn_nine_nine_AND_the_ellen_degeneres_show_aux().

