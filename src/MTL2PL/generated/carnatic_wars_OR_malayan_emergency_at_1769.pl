:- include('database.pl').
carnatic_wars(Start,End) :- begin('carnatic_wars',_,_,Start), end('carnatic_wars',_,_,End), Start=<End.

malayan_emergency(Start,End) :- begin('malayan_emergency',_,_,Start), end('malayan_emergency',_,_,End), Start=<End.

generate_facts_carnatic_wars_OR_malayan_emergency([]) :- assert(carnatic_wars_OR_malayan_emergency(-1,-1)).

generate_facts_carnatic_wars_OR_malayan_emergency([(Start,End) | Tail]) :- assert(carnatic_wars_OR_malayan_emergency(Start,End)), generate_facts_carnatic_wars_OR_malayan_emergency(Tail).

carnatic_wars_OR_malayan_emergency_aux() :- findall((Start,End),carnatic_wars(Start,End),Interval1), findall((Start,End),malayan_emergency(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_carnatic_wars_OR_malayan_emergency(Interval).

carnatic_wars_OR_malayan_emergency_at_1769(Res) :- setof((Start,End),carnatic_wars_OR_malayan_emergency(Start,End),AllINtervals), checkvalidity(1769,AllINtervals,Res).

check_query() :- write('Query = carnatic_wars_OR_malayan_emergency_at_1769'), (carnatic_wars_OR_malayan_emergency_at_1769(true) -> write('\nRes   = true');write('\nRes   = false')).
?- carnatic_wars_OR_malayan_emergency_aux().

