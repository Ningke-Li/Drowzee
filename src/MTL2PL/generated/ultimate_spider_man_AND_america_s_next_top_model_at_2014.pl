:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

generate_facts_ultimate_spider_man_AND_america_s_next_top_model([]) :- assert(ultimate_spider_man_AND_america_s_next_top_model(-1,-1)).

generate_facts_ultimate_spider_man_AND_america_s_next_top_model([(Start,End) | Tail]) :- assert(ultimate_spider_man_AND_america_s_next_top_model(Start,End)), generate_facts_ultimate_spider_man_AND_america_s_next_top_model(Tail).

ultimate_spider_man_AND_america_s_next_top_model_aux() :- findall((Start,End),ultimate_spider_man(Start,End),Interval1), findall((Start,End),america_s_next_top_model(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ultimate_spider_man_AND_america_s_next_top_model(Interval).

ultimate_spider_man_AND_america_s_next_top_model_at_2014(Res) :- setof((Start,End),ultimate_spider_man_AND_america_s_next_top_model(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ultimate_spider_man_AND_america_s_next_top_model_at_2014'), (ultimate_spider_man_AND_america_s_next_top_model_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ultimate_spider_man_AND_america_s_next_top_model_aux().

