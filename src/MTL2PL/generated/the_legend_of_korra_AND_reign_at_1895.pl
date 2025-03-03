:- include('database.pl').
the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

generate_facts_the_legend_of_korra_AND_reign([]) :- assert(the_legend_of_korra_AND_reign(-1,-1)).

generate_facts_the_legend_of_korra_AND_reign([(Start,End) | Tail]) :- assert(the_legend_of_korra_AND_reign(Start,End)), generate_facts_the_legend_of_korra_AND_reign(Tail).

the_legend_of_korra_AND_reign_aux() :- findall((Start,End),the_legend_of_korra(Start,End),Interval1), findall((Start,End),reign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_legend_of_korra_AND_reign(Interval).

the_legend_of_korra_AND_reign_at_1895(Res) :- setof((Start,End),the_legend_of_korra_AND_reign(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = the_legend_of_korra_AND_reign_at_1895'), (the_legend_of_korra_AND_reign_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_legend_of_korra_AND_reign_aux().

