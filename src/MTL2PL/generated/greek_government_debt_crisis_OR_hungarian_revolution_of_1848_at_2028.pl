:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

hungarian_revolution_of_1848(Start,End) :- begin('hungarian_revolution_of_1848',_,_,Start), end('hungarian_revolution_of_1848',_,_,End), Start=<End.

generate_facts_greek_government_debt_crisis_OR_hungarian_revolution_of_1848([]) :- assert(greek_government_debt_crisis_OR_hungarian_revolution_of_1848(-1,-1)).

generate_facts_greek_government_debt_crisis_OR_hungarian_revolution_of_1848([(Start,End) | Tail]) :- assert(greek_government_debt_crisis_OR_hungarian_revolution_of_1848(Start,End)), generate_facts_greek_government_debt_crisis_OR_hungarian_revolution_of_1848(Tail).

greek_government_debt_crisis_OR_hungarian_revolution_of_1848_aux() :- findall((Start,End),greek_government_debt_crisis(Start,End),Interval1), findall((Start,End),hungarian_revolution_of_1848(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greek_government_debt_crisis_OR_hungarian_revolution_of_1848(Interval).

greek_government_debt_crisis_OR_hungarian_revolution_of_1848_at_2028(Res) :- setof((Start,End),greek_government_debt_crisis_OR_hungarian_revolution_of_1848(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = greek_government_debt_crisis_OR_hungarian_revolution_of_1848_at_2028'), (greek_government_debt_crisis_OR_hungarian_revolution_of_1848_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_government_debt_crisis_OR_hungarian_revolution_of_1848_aux().

