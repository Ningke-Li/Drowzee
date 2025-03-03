:- include('database.pl').
uefa_euro_2004_qualifying(Start,End) :- begin('uefa_euro_2004_qualifying',_,_,Start), end('uefa_euro_2004_qualifying',_,_,End), Start=<End.

estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

generate_facts_uefa_euro_2004_qualifying_AND_estonian_kroon([]) :- assert(uefa_euro_2004_qualifying_AND_estonian_kroon(-1,-1)).

generate_facts_uefa_euro_2004_qualifying_AND_estonian_kroon([(Start,End) | Tail]) :- assert(uefa_euro_2004_qualifying_AND_estonian_kroon(Start,End)), generate_facts_uefa_euro_2004_qualifying_AND_estonian_kroon(Tail).

uefa_euro_2004_qualifying_AND_estonian_kroon_aux() :- findall((Start,End),uefa_euro_2004_qualifying(Start,End),Interval1), findall((Start,End),estonian_kroon(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_uefa_euro_2004_qualifying_AND_estonian_kroon(Interval).

uefa_euro_2004_qualifying_AND_estonian_kroon_at_1945(Res) :- setof((Start,End),uefa_euro_2004_qualifying_AND_estonian_kroon(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2004_qualifying_AND_estonian_kroon_at_1945'), (uefa_euro_2004_qualifying_AND_estonian_kroon_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2004_qualifying_AND_estonian_kroon_aux().

