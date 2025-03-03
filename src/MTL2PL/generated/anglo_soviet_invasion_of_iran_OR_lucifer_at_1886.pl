:- include('database.pl').
anglo_soviet_invasion_of_iran(Start,End) :- begin('anglo_soviet_invasion_of_iran',_,_,Start), end('anglo_soviet_invasion_of_iran',_,_,End), Start=<End.

lucifer(Start,End) :- begin('lucifer',_,_,Start), end('lucifer',_,_,End), Start=<End.

generate_facts_anglo_soviet_invasion_of_iran_OR_lucifer([]) :- assert(anglo_soviet_invasion_of_iran_OR_lucifer(-1,-1)).

generate_facts_anglo_soviet_invasion_of_iran_OR_lucifer([(Start,End) | Tail]) :- assert(anglo_soviet_invasion_of_iran_OR_lucifer(Start,End)), generate_facts_anglo_soviet_invasion_of_iran_OR_lucifer(Tail).

anglo_soviet_invasion_of_iran_OR_lucifer_aux() :- findall((Start,End),anglo_soviet_invasion_of_iran(Start,End),Interval1), findall((Start,End),lucifer(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_anglo_soviet_invasion_of_iran_OR_lucifer(Interval).

anglo_soviet_invasion_of_iran_OR_lucifer_at_1886(Res) :- setof((Start,End),anglo_soviet_invasion_of_iran_OR_lucifer(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = anglo_soviet_invasion_of_iran_OR_lucifer_at_1886'), (anglo_soviet_invasion_of_iran_OR_lucifer_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- anglo_soviet_invasion_of_iran_OR_lucifer_aux().

