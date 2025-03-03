:- include('database.pl').
peanuts(Start,End) :- begin('peanuts',_,_,Start), end('peanuts',_,_,End), Start=<End.

july_2016(Start,End) :- begin('july_2016',_,_,Start), end('july_2016',_,_,End), Start=<End.

generate_facts_peanuts_OR_july_2016([]) :- assert(peanuts_OR_july_2016(-1,-1)).

generate_facts_peanuts_OR_july_2016([(Start,End) | Tail]) :- assert(peanuts_OR_july_2016(Start,End)), generate_facts_peanuts_OR_july_2016(Tail).

peanuts_OR_july_2016_aux() :- findall((Start,End),peanuts(Start,End),Interval1), findall((Start,End),july_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_peanuts_OR_july_2016(Interval).

peanuts_OR_july_2016_at_1984(Res) :- setof((Start,End),peanuts_OR_july_2016(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = peanuts_OR_july_2016_at_1984'), (peanuts_OR_july_2016_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peanuts_OR_july_2016_aux().

