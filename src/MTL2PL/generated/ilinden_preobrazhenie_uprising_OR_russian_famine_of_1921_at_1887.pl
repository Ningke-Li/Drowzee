:- include('database.pl').
ilinden_preobrazhenie_uprising(Start,End) :- begin('ilinden_preobrazhenie_uprising',_,_,Start), end('ilinden_preobrazhenie_uprising',_,_,End), Start=<End.

russian_famine_of_1921(Start,End) :- begin('russian_famine_of_1921',_,_,Start), end('russian_famine_of_1921',_,_,End), Start=<End.

generate_facts_ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921([]) :- assert(ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921(-1,-1)).

generate_facts_ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921([(Start,End) | Tail]) :- assert(ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921(Start,End)), generate_facts_ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921(Tail).

ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921_aux() :- findall((Start,End),ilinden_preobrazhenie_uprising(Start,End),Interval1), findall((Start,End),russian_famine_of_1921(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921(Interval).

ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921_at_1887(Res) :- setof((Start,End),ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921_at_1887'), (ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ilinden_preobrazhenie_uprising_OR_russian_famine_of_1921_aux().

