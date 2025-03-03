:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

generate_facts_new_deal_AND_salvadoran_col_n([]) :- assert(new_deal_AND_salvadoran_col_n(-1,-1)).

generate_facts_new_deal_AND_salvadoran_col_n([(Start,End) | Tail]) :- assert(new_deal_AND_salvadoran_col_n(Start,End)), generate_facts_new_deal_AND_salvadoran_col_n(Tail).

new_deal_AND_salvadoran_col_n_aux() :- findall((Start,End),new_deal(Start,End),Interval1), findall((Start,End),salvadoran_col_n(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_deal_AND_salvadoran_col_n(Interval).

new_deal_AND_salvadoran_col_n_at_1939(Res) :- setof((Start,End),new_deal_AND_salvadoran_col_n(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = new_deal_AND_salvadoran_col_n_at_1939'), (new_deal_AND_salvadoran_col_n_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_deal_AND_salvadoran_col_n_aux().

