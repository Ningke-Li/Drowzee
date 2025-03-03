:- include('database.pl').
the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

generate_facts_the_man_in_the_high_castle_AND_regular_show([]) :- assert(the_man_in_the_high_castle_AND_regular_show(-1,-1)).

generate_facts_the_man_in_the_high_castle_AND_regular_show([(Start,End) | Tail]) :- assert(the_man_in_the_high_castle_AND_regular_show(Start,End)), generate_facts_the_man_in_the_high_castle_AND_regular_show(Tail).

the_man_in_the_high_castle_AND_regular_show_aux() :- findall((Start,End),the_man_in_the_high_castle(Start,End),Interval1), findall((Start,End),regular_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_man_in_the_high_castle_AND_regular_show(Interval).

the_man_in_the_high_castle_AND_regular_show_at_1930(Res) :- setof((Start,End),the_man_in_the_high_castle_AND_regular_show(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = the_man_in_the_high_castle_AND_regular_show_at_1930'), (the_man_in_the_high_castle_AND_regular_show_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_man_in_the_high_castle_AND_regular_show_aux().

