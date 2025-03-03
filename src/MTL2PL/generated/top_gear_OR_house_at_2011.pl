:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

generate_facts_top_gear_OR_house([]) :- assert(top_gear_OR_house(-1,-1)).

generate_facts_top_gear_OR_house([(Start,End) | Tail]) :- assert(top_gear_OR_house(Start,End)), generate_facts_top_gear_OR_house(Tail).

top_gear_OR_house_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),house(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_top_gear_OR_house(Interval).

top_gear_OR_house_at_2011(Res) :- setof((Start,End),top_gear_OR_house(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = top_gear_OR_house_at_2011'), (top_gear_OR_house_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_OR_house_aux().

