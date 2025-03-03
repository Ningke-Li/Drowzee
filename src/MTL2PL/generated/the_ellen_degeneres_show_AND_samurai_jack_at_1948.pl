:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

generate_facts_the_ellen_degeneres_show_AND_samurai_jack([]) :- assert(the_ellen_degeneres_show_AND_samurai_jack(-1,-1)).

generate_facts_the_ellen_degeneres_show_AND_samurai_jack([(Start,End) | Tail]) :- assert(the_ellen_degeneres_show_AND_samurai_jack(Start,End)), generate_facts_the_ellen_degeneres_show_AND_samurai_jack(Tail).

the_ellen_degeneres_show_AND_samurai_jack_aux() :- findall((Start,End),the_ellen_degeneres_show(Start,End),Interval1), findall((Start,End),samurai_jack(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_ellen_degeneres_show_AND_samurai_jack(Interval).

the_ellen_degeneres_show_AND_samurai_jack_at_1948(Res) :- setof((Start,End),the_ellen_degeneres_show_AND_samurai_jack(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_AND_samurai_jack_at_1948'), (the_ellen_degeneres_show_AND_samurai_jack_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_ellen_degeneres_show_AND_samurai_jack_aux().

