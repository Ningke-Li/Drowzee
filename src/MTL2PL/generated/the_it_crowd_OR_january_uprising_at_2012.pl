:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

january_uprising(Start,End) :- begin('january_uprising',_,_,Start), end('january_uprising',_,_,End), Start=<End.

generate_facts_the_it_crowd_OR_january_uprising([]) :- assert(the_it_crowd_OR_january_uprising(-1,-1)).

generate_facts_the_it_crowd_OR_january_uprising([(Start,End) | Tail]) :- assert(the_it_crowd_OR_january_uprising(Start,End)), generate_facts_the_it_crowd_OR_january_uprising(Tail).

the_it_crowd_OR_january_uprising_aux() :- findall((Start,End),the_it_crowd(Start,End),Interval1), findall((Start,End),january_uprising(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_it_crowd_OR_january_uprising(Interval).

the_it_crowd_OR_january_uprising_at_2012(Res) :- setof((Start,End),the_it_crowd_OR_january_uprising(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = the_it_crowd_OR_january_uprising_at_2012'), (the_it_crowd_OR_january_uprising_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_it_crowd_OR_january_uprising_aux().

