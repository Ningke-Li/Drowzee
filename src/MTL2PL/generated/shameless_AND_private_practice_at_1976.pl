:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

generate_facts_shameless_AND_private_practice([]) :- assert(shameless_AND_private_practice(-1,-1)).

generate_facts_shameless_AND_private_practice([(Start,End) | Tail]) :- assert(shameless_AND_private_practice(Start,End)), generate_facts_shameless_AND_private_practice(Tail).

shameless_AND_private_practice_aux() :- findall((Start,End),shameless(Start,End),Interval1), findall((Start,End),private_practice(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_shameless_AND_private_practice(Interval).

shameless_AND_private_practice_at_1976(Res) :- setof((Start,End),shameless_AND_private_practice(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = shameless_AND_private_practice_at_1976'), (shameless_AND_private_practice_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).
?- shameless_AND_private_practice_aux().

