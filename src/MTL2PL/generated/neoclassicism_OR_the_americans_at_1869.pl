:- include('database.pl').
neoclassicism(Start,End) :- begin('neoclassicism',_,_,Start), end('neoclassicism',_,_,End), Start=<End.

the_americans(Start,End) :- begin('the_americans',_,_,Start), end('the_americans',_,_,End), Start=<End.

generate_facts_neoclassicism_OR_the_americans([]) :- assert(neoclassicism_OR_the_americans(-1,-1)).

generate_facts_neoclassicism_OR_the_americans([(Start,End) | Tail]) :- assert(neoclassicism_OR_the_americans(Start,End)), generate_facts_neoclassicism_OR_the_americans(Tail).

neoclassicism_OR_the_americans_aux() :- findall((Start,End),neoclassicism(Start,End),Interval1), findall((Start,End),the_americans(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_neoclassicism_OR_the_americans(Interval).

neoclassicism_OR_the_americans_at_1869(Res) :- setof((Start,End),neoclassicism_OR_the_americans(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = neoclassicism_OR_the_americans_at_1869'), (neoclassicism_OR_the_americans_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- neoclassicism_OR_the_americans_aux().

