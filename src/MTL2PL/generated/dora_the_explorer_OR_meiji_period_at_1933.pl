:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

meiji_period(Start,End) :- begin('meiji_period',_,_,Start), end('meiji_period',_,_,End), Start=<End.

generate_facts_dora_the_explorer_OR_meiji_period([]) :- assert(dora_the_explorer_OR_meiji_period(-1,-1)).

generate_facts_dora_the_explorer_OR_meiji_period([(Start,End) | Tail]) :- assert(dora_the_explorer_OR_meiji_period(Start,End)), generate_facts_dora_the_explorer_OR_meiji_period(Tail).

dora_the_explorer_OR_meiji_period_aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),meiji_period(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_OR_meiji_period(Interval).

dora_the_explorer_OR_meiji_period_at_1933(Res) :- setof((Start,End),dora_the_explorer_OR_meiji_period(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_OR_meiji_period_at_1933'), (dora_the_explorer_OR_meiji_period_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_OR_meiji_period_aux().

