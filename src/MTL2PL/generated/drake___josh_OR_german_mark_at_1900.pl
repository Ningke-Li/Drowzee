:- include('database.pl').
drake___josh(Start,End) :- begin('drake___josh',_,_,Start), end('drake___josh',_,_,End), Start=<End.

german_mark(Start,End) :- begin('german_mark',_,_,Start), end('german_mark',_,_,End), Start=<End.

generate_facts_drake___josh_OR_german_mark([]) :- assert(drake___josh_OR_german_mark(-1,-1)).

generate_facts_drake___josh_OR_german_mark([(Start,End) | Tail]) :- assert(drake___josh_OR_german_mark(Start,End)), generate_facts_drake___josh_OR_german_mark(Tail).

drake___josh_OR_german_mark_aux() :- findall((Start,End),drake___josh(Start,End),Interval1), findall((Start,End),german_mark(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_drake___josh_OR_german_mark(Interval).

drake___josh_OR_german_mark_at_1900(Res) :- setof((Start,End),drake___josh_OR_german_mark(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = drake___josh_OR_german_mark_at_1900'), (drake___josh_OR_german_mark_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- drake___josh_OR_german_mark_aux().

