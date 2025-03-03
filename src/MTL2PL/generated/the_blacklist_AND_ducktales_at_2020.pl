:- include('database.pl').
the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

ducktales(Start,End) :- begin('ducktales',_,_,Start), end('ducktales',_,_,End), Start=<End.

generate_facts_the_blacklist_AND_ducktales([]) :- assert(the_blacklist_AND_ducktales(-1,-1)).

generate_facts_the_blacklist_AND_ducktales([(Start,End) | Tail]) :- assert(the_blacklist_AND_ducktales(Start,End)), generate_facts_the_blacklist_AND_ducktales(Tail).

the_blacklist_AND_ducktales_aux() :- findall((Start,End),the_blacklist(Start,End),Interval1), findall((Start,End),ducktales(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_blacklist_AND_ducktales(Interval).

the_blacklist_AND_ducktales_at_2020(Res) :- setof((Start,End),the_blacklist_AND_ducktales(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = the_blacklist_AND_ducktales_at_2020'), (the_blacklist_AND_ducktales_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_blacklist_AND_ducktales_aux().

