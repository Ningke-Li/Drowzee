:- include('database.pl').
uefa_euro_2004_qualifying(Start,End) :- begin('uefa_euro_2004_qualifying',_,_,Start), end('uefa_euro_2004_qualifying',_,_,End), Start=<End.

san_remo_conference(Start,End) :- begin('san_remo_conference',_,_,Start), end('san_remo_conference',_,_,End), Start=<End.

generate_facts_uefa_euro_2004_qualifying_OR_san_remo_conference([]) :- assert(uefa_euro_2004_qualifying_OR_san_remo_conference(-1,-1)).

generate_facts_uefa_euro_2004_qualifying_OR_san_remo_conference([(Start,End) | Tail]) :- assert(uefa_euro_2004_qualifying_OR_san_remo_conference(Start,End)), generate_facts_uefa_euro_2004_qualifying_OR_san_remo_conference(Tail).

uefa_euro_2004_qualifying_OR_san_remo_conference_aux() :- findall((Start,End),uefa_euro_2004_qualifying(Start,End),Interval1), findall((Start,End),san_remo_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2004_qualifying_OR_san_remo_conference(Interval).

uefa_euro_2004_qualifying_OR_san_remo_conference_at_1860(Res) :- setof((Start,End),uefa_euro_2004_qualifying_OR_san_remo_conference(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2004_qualifying_OR_san_remo_conference_at_1860'), (uefa_euro_2004_qualifying_OR_san_remo_conference_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2004_qualifying_OR_san_remo_conference_aux().

