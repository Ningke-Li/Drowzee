:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

vatican_lira(Start,End) :- begin('vatican_lira',_,_,Start), end('vatican_lira',_,_,End), Start=<End.

generate_facts_sultanate_of_women_OR_vatican_lira([]) :- assert(sultanate_of_women_OR_vatican_lira(-1,-1)).

generate_facts_sultanate_of_women_OR_vatican_lira([(Start,End) | Tail]) :- assert(sultanate_of_women_OR_vatican_lira(Start,End)), generate_facts_sultanate_of_women_OR_vatican_lira(Tail).

sultanate_of_women_OR_vatican_lira_aux() :- findall((Start,End),sultanate_of_women(Start,End),Interval1), findall((Start,End),vatican_lira(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sultanate_of_women_OR_vatican_lira(Interval).

sultanate_of_women_OR_vatican_lira_at_1807(Res) :- setof((Start,End),sultanate_of_women_OR_vatican_lira(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = sultanate_of_women_OR_vatican_lira_at_1807'), (sultanate_of_women_OR_vatican_lira_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sultanate_of_women_OR_vatican_lira_aux().

