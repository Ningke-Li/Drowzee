:- include('database.pl').
deaths_in_2016(Start,End) :- begin('deaths_in_2016',_,_,Start), end('deaths_in_2016',_,_,End), Start=<End.

constitutional_convention(Start,End) :- begin('constitutional_convention',_,_,Start), end('constitutional_convention',_,_,End), Start=<End.

generate_facts_deaths_in_2016_OR_constitutional_convention([]) :- assert(deaths_in_2016_OR_constitutional_convention(-1,-1)).

generate_facts_deaths_in_2016_OR_constitutional_convention([(Start,End) | Tail]) :- assert(deaths_in_2016_OR_constitutional_convention(Start,End)), generate_facts_deaths_in_2016_OR_constitutional_convention(Tail).

deaths_in_2016_OR_constitutional_convention_aux() :- findall((Start,End),deaths_in_2016(Start,End),Interval1), findall((Start,End),constitutional_convention(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_deaths_in_2016_OR_constitutional_convention(Interval).

deaths_in_2016_OR_constitutional_convention_at_1895(Res) :- setof((Start,End),deaths_in_2016_OR_constitutional_convention(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = deaths_in_2016_OR_constitutional_convention_at_1895'), (deaths_in_2016_OR_constitutional_convention_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- deaths_in_2016_OR_constitutional_convention_aux().

