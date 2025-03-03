:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

generate_facts_american_indian_wars_AND_nazism([]) :- assert(american_indian_wars_AND_nazism(-1,-1)).

generate_facts_american_indian_wars_AND_nazism([(Start,End) | Tail]) :- assert(american_indian_wars_AND_nazism(Start,End)), generate_facts_american_indian_wars_AND_nazism(Tail).

american_indian_wars_AND_nazism_aux() :- findall((Start,End),american_indian_wars(Start,End),Interval1), findall((Start,End),nazism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_american_indian_wars_AND_nazism(Interval).

american_indian_wars_AND_nazism_at_1822(Res) :- setof((Start,End),american_indian_wars_AND_nazism(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = american_indian_wars_AND_nazism_at_1822'), (american_indian_wars_AND_nazism_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).
?- american_indian_wars_AND_nazism_aux().

