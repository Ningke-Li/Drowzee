:- include('database.pl').
icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

operation_market_garden(Start,End) :- begin('operation_market_garden',_,_,Start), end('operation_market_garden',_,_,End), Start=<End.

generate_facts_icarly_OR_operation_market_garden([]) :- assert(icarly_OR_operation_market_garden(-1,-1)).

generate_facts_icarly_OR_operation_market_garden([(Start,End) | Tail]) :- assert(icarly_OR_operation_market_garden(Start,End)), generate_facts_icarly_OR_operation_market_garden(Tail).

icarly_OR_operation_market_garden_aux() :- findall((Start,End),icarly(Start,End),Interval1), findall((Start,End),operation_market_garden(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_icarly_OR_operation_market_garden(Interval).

icarly_OR_operation_market_garden_at_1984(Res) :- setof((Start,End),icarly_OR_operation_market_garden(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = icarly_OR_operation_market_garden_at_1984'), (icarly_OR_operation_market_garden_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- icarly_OR_operation_market_garden_aux().

