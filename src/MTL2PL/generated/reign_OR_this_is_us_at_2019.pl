:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

generate_facts_reign_OR_this_is_us([]) :- assert(reign_OR_this_is_us(-1,-1)).

generate_facts_reign_OR_this_is_us([(Start,End) | Tail]) :- assert(reign_OR_this_is_us(Start,End)), generate_facts_reign_OR_this_is_us(Tail).

reign_OR_this_is_us_aux() :- findall((Start,End),reign(Start,End),Interval1), findall((Start,End),this_is_us(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_reign_OR_this_is_us(Interval).

reign_OR_this_is_us_at_2019(Res) :- setof((Start,End),reign_OR_this_is_us(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = reign_OR_this_is_us_at_2019'), (reign_OR_this_is_us_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reign_OR_this_is_us_aux().

