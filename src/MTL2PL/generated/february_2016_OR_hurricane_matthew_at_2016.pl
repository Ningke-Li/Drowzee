:- include('database.pl').
february_2016(Start,End) :- begin('february_2016',_,_,Start), end('february_2016',_,_,End), Start=<End.

hurricane_matthew(Start,End) :- begin('hurricane_matthew',_,_,Start), end('hurricane_matthew',_,_,End), Start=<End.

generate_facts_february_2016_OR_hurricane_matthew([]) :- assert(february_2016_OR_hurricane_matthew(-1,-1)).

generate_facts_february_2016_OR_hurricane_matthew([(Start,End) | Tail]) :- assert(february_2016_OR_hurricane_matthew(Start,End)), generate_facts_february_2016_OR_hurricane_matthew(Tail).

february_2016_OR_hurricane_matthew_aux() :- findall((Start,End),february_2016(Start,End),Interval1), findall((Start,End),hurricane_matthew(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_february_2016_OR_hurricane_matthew(Interval).

february_2016_OR_hurricane_matthew_at_2016(Res) :- setof((Start,End),february_2016_OR_hurricane_matthew(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = february_2016_OR_hurricane_matthew_at_2016'), (february_2016_OR_hurricane_matthew_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- february_2016_OR_hurricane_matthew_aux().

