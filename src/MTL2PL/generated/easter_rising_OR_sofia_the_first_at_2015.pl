:- include('database.pl').
easter_rising(Start,End) :- begin('easter_rising',_,_,Start), end('easter_rising',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

generate_facts_easter_rising_OR_sofia_the_first([]) :- assert(easter_rising_OR_sofia_the_first(-1,-1)).

generate_facts_easter_rising_OR_sofia_the_first([(Start,End) | Tail]) :- assert(easter_rising_OR_sofia_the_first(Start,End)), generate_facts_easter_rising_OR_sofia_the_first(Tail).

easter_rising_OR_sofia_the_first_aux() :- findall((Start,End),easter_rising(Start,End),Interval1), findall((Start,End),sofia_the_first(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_easter_rising_OR_sofia_the_first(Interval).

easter_rising_OR_sofia_the_first_at_2015(Res) :- setof((Start,End),easter_rising_OR_sofia_the_first(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = easter_rising_OR_sofia_the_first_at_2015'), (easter_rising_OR_sofia_the_first_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- easter_rising_OR_sofia_the_first_aux().

