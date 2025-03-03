:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

generate_facts_ultimate_spider_man_AND_regular_show([]) :- assert(ultimate_spider_man_AND_regular_show(-1,-1)).

generate_facts_ultimate_spider_man_AND_regular_show([(Start,End) | Tail]) :- assert(ultimate_spider_man_AND_regular_show(Start,End)), generate_facts_ultimate_spider_man_AND_regular_show(Tail).

ultimate_spider_man_AND_regular_show_aux() :- findall((Start,End),ultimate_spider_man(Start,End),Interval1), findall((Start,End),regular_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ultimate_spider_man_AND_regular_show(Interval).

ultimate_spider_man_AND_regular_show_at_1931(Res) :- setof((Start,End),ultimate_spider_man_AND_regular_show(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = ultimate_spider_man_AND_regular_show_at_1931'), (ultimate_spider_man_AND_regular_show_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ultimate_spider_man_AND_regular_show_aux().

