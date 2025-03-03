:- include('database.pl').
this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

generate_facts_this_is_us_AND_ncis__los_angeles([]) :- assert(this_is_us_AND_ncis__los_angeles(-1,-1)).

generate_facts_this_is_us_AND_ncis__los_angeles([(Start,End) | Tail]) :- assert(this_is_us_AND_ncis__los_angeles(Start,End)), generate_facts_this_is_us_AND_ncis__los_angeles(Tail).

this_is_us_AND_ncis__los_angeles_aux() :- findall((Start,End),this_is_us(Start,End),Interval1), findall((Start,End),ncis__los_angeles(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_this_is_us_AND_ncis__los_angeles(Interval).

this_is_us_AND_ncis__los_angeles_at_2017(Res) :- setof((Start,End),this_is_us_AND_ncis__los_angeles(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = this_is_us_AND_ncis__los_angeles_at_2017'), (this_is_us_AND_ncis__los_angeles_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- this_is_us_AND_ncis__los_angeles_aux().

