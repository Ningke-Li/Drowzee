:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

generate_facts_the_fairly_oddparents_AND_the_legend_of_korra([]) :- assert(the_fairly_oddparents_AND_the_legend_of_korra(-1,-1)).

generate_facts_the_fairly_oddparents_AND_the_legend_of_korra([(Start,End) | Tail]) :- assert(the_fairly_oddparents_AND_the_legend_of_korra(Start,End)), generate_facts_the_fairly_oddparents_AND_the_legend_of_korra(Tail).

the_fairly_oddparents_AND_the_legend_of_korra_aux() :- findall((Start,End),the_fairly_oddparents(Start,End),Interval1), findall((Start,End),the_legend_of_korra(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_fairly_oddparents_AND_the_legend_of_korra(Interval).

the_fairly_oddparents_AND_the_legend_of_korra_at_1950(Res) :- setof((Start,End),the_fairly_oddparents_AND_the_legend_of_korra(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = the_fairly_oddparents_AND_the_legend_of_korra_at_1950'), (the_fairly_oddparents_AND_the_legend_of_korra_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_fairly_oddparents_AND_the_legend_of_korra_aux().

