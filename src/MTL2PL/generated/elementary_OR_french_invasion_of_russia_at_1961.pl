:- include('database.pl').
elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

french_invasion_of_russia(Start,End) :- begin('french_invasion_of_russia',_,_,Start), end('french_invasion_of_russia',_,_,End), Start=<End.

generate_facts_elementary_OR_french_invasion_of_russia([]) :- assert(elementary_OR_french_invasion_of_russia(-1,-1)).

generate_facts_elementary_OR_french_invasion_of_russia([(Start,End) | Tail]) :- assert(elementary_OR_french_invasion_of_russia(Start,End)), generate_facts_elementary_OR_french_invasion_of_russia(Tail).

elementary_OR_french_invasion_of_russia_aux() :- findall((Start,End),elementary(Start,End),Interval1), findall((Start,End),french_invasion_of_russia(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_elementary_OR_french_invasion_of_russia(Interval).

elementary_OR_french_invasion_of_russia_at_1961(Res) :- setof((Start,End),elementary_OR_french_invasion_of_russia(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = elementary_OR_french_invasion_of_russia_at_1961'), (elementary_OR_french_invasion_of_russia_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).
?- elementary_OR_french_invasion_of_russia_aux().

