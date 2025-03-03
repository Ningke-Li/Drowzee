:- include('database.pl').
danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

generate_facts_danny_phantom_OR_legends_of_tomorrow([]) :- assert(danny_phantom_OR_legends_of_tomorrow(-1,-1)).

generate_facts_danny_phantom_OR_legends_of_tomorrow([(Start,End) | Tail]) :- assert(danny_phantom_OR_legends_of_tomorrow(Start,End)), generate_facts_danny_phantom_OR_legends_of_tomorrow(Tail).

danny_phantom_OR_legends_of_tomorrow_aux() :- findall((Start,End),danny_phantom(Start,End),Interval1), findall((Start,End),legends_of_tomorrow(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_danny_phantom_OR_legends_of_tomorrow(Interval).

danny_phantom_OR_legends_of_tomorrow_at_2018(Res) :- setof((Start,End),danny_phantom_OR_legends_of_tomorrow(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = danny_phantom_OR_legends_of_tomorrow_at_2018'), (danny_phantom_OR_legends_of_tomorrow_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- danny_phantom_OR_legends_of_tomorrow_aux().

