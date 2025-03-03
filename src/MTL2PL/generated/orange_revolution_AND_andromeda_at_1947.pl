:- include('database.pl').
orange_revolution(Start,End) :- begin('orange_revolution',_,_,Start), end('orange_revolution',_,_,End), Start=<End.

andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

generate_facts_orange_revolution_AND_andromeda([]) :- assert(orange_revolution_AND_andromeda(-1,-1)).

generate_facts_orange_revolution_AND_andromeda([(Start,End) | Tail]) :- assert(orange_revolution_AND_andromeda(Start,End)), generate_facts_orange_revolution_AND_andromeda(Tail).

orange_revolution_AND_andromeda_aux() :- findall((Start,End),orange_revolution(Start,End),Interval1), findall((Start,End),andromeda(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orange_revolution_AND_andromeda(Interval).

orange_revolution_AND_andromeda_at_1947(Res) :- setof((Start,End),orange_revolution_AND_andromeda(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = orange_revolution_AND_andromeda_at_1947'), (orange_revolution_AND_andromeda_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orange_revolution_AND_andromeda_aux().

