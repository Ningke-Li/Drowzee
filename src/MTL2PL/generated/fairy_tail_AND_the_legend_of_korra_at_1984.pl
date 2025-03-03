:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

generate_facts_fairy_tail_AND_the_legend_of_korra([]) :- assert(fairy_tail_AND_the_legend_of_korra(-1,-1)).

generate_facts_fairy_tail_AND_the_legend_of_korra([(Start,End) | Tail]) :- assert(fairy_tail_AND_the_legend_of_korra(Start,End)), generate_facts_fairy_tail_AND_the_legend_of_korra(Tail).

fairy_tail_AND_the_legend_of_korra_aux() :- findall((Start,End),fairy_tail(Start,End),Interval1), findall((Start,End),the_legend_of_korra(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_fairy_tail_AND_the_legend_of_korra(Interval).

fairy_tail_AND_the_legend_of_korra_at_1984(Res) :- setof((Start,End),fairy_tail_AND_the_legend_of_korra(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = fairy_tail_AND_the_legend_of_korra_at_1984'), (fairy_tail_AND_the_legend_of_korra_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fairy_tail_AND_the_legend_of_korra_aux().

