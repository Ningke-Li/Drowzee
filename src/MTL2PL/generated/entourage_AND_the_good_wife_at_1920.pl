:- include('database.pl').
entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

generate_facts_entourage_AND_the_good_wife([]) :- assert(entourage_AND_the_good_wife(-1,-1)).

generate_facts_entourage_AND_the_good_wife([(Start,End) | Tail]) :- assert(entourage_AND_the_good_wife(Start,End)), generate_facts_entourage_AND_the_good_wife(Tail).

entourage_AND_the_good_wife_aux() :- findall((Start,End),entourage(Start,End),Interval1), findall((Start,End),the_good_wife(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_entourage_AND_the_good_wife(Interval).

entourage_AND_the_good_wife_at_1920(Res) :- setof((Start,End),entourage_AND_the_good_wife(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = entourage_AND_the_good_wife_at_1920'), (entourage_AND_the_good_wife_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).
?- entourage_AND_the_good_wife_aux().

