:- include('database.pl').
continental_congress(Start,End) :- begin('continental_congress',_,_,Start), end('continental_congress',_,_,End), Start=<End.

sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

generate_facts_continental_congress_AND_sakoku([]) :- assert(continental_congress_AND_sakoku(-1,-1)).

generate_facts_continental_congress_AND_sakoku([(Start,End) | Tail]) :- assert(continental_congress_AND_sakoku(Start,End)), generate_facts_continental_congress_AND_sakoku(Tail).

continental_congress_AND_sakoku_aux() :- findall((Start,End),continental_congress(Start,End),Interval1), findall((Start,End),sakoku(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_continental_congress_AND_sakoku(Interval).

continental_congress_AND_sakoku_at_1802(Res) :- setof((Start,End),continental_congress_AND_sakoku(Start,End),AllINtervals), checkvalidity(1802,AllINtervals,Res).

check_query() :- write('Query = continental_congress_AND_sakoku_at_1802'), (continental_congress_AND_sakoku_at_1802(true) -> write('\nRes   = true');write('\nRes   = false')).
?- continental_congress_AND_sakoku_aux().

