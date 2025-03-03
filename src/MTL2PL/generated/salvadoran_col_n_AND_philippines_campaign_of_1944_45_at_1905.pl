:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

philippines_campaign_of_1944_45(Start,End) :- begin('philippines_campaign_of_1944_45',_,_,Start), end('philippines_campaign_of_1944_45',_,_,End), Start=<End.

generate_facts_salvadoran_col_n_AND_philippines_campaign_of_1944_45([]) :- assert(salvadoran_col_n_AND_philippines_campaign_of_1944_45(-1,-1)).

generate_facts_salvadoran_col_n_AND_philippines_campaign_of_1944_45([(Start,End) | Tail]) :- assert(salvadoran_col_n_AND_philippines_campaign_of_1944_45(Start,End)), generate_facts_salvadoran_col_n_AND_philippines_campaign_of_1944_45(Tail).

salvadoran_col_n_AND_philippines_campaign_of_1944_45_aux() :- findall((Start,End),salvadoran_col_n(Start,End),Interval1), findall((Start,End),philippines_campaign_of_1944_45(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_salvadoran_col_n_AND_philippines_campaign_of_1944_45(Interval).

salvadoran_col_n_AND_philippines_campaign_of_1944_45_at_1905(Res) :- setof((Start,End),salvadoran_col_n_AND_philippines_campaign_of_1944_45(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = salvadoran_col_n_AND_philippines_campaign_of_1944_45_at_1905'), (salvadoran_col_n_AND_philippines_campaign_of_1944_45_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).
?- salvadoran_col_n_AND_philippines_campaign_of_1944_45_aux().

