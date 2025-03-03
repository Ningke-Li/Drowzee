:- include('database.pl').
uefa_euro_2012_group_a(Start,End) :- begin('uefa_euro_2012_group_a',_,_,Start), end('uefa_euro_2012_group_a',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

generate_facts_uefa_euro_2012_group_a_OR_this_is_us([]) :- assert(uefa_euro_2012_group_a_OR_this_is_us(-1,-1)).

generate_facts_uefa_euro_2012_group_a_OR_this_is_us([(Start,End) | Tail]) :- assert(uefa_euro_2012_group_a_OR_this_is_us(Start,End)), generate_facts_uefa_euro_2012_group_a_OR_this_is_us(Tail).

uefa_euro_2012_group_a_OR_this_is_us_aux() :- findall((Start,End),uefa_euro_2012_group_a(Start,End),Interval1), findall((Start,End),this_is_us(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2012_group_a_OR_this_is_us(Interval).

uefa_euro_2012_group_a_OR_this_is_us_at_2019(Res) :- setof((Start,End),uefa_euro_2012_group_a_OR_this_is_us(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2012_group_a_OR_this_is_us_at_2019'), (uefa_euro_2012_group_a_OR_this_is_us_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2012_group_a_OR_this_is_us_aux().

