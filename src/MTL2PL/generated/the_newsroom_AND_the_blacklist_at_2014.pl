:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

generate_facts_the_newsroom_AND_the_blacklist([]) :- assert(the_newsroom_AND_the_blacklist(-1,-1)).

generate_facts_the_newsroom_AND_the_blacklist([(Start,End) | Tail]) :- assert(the_newsroom_AND_the_blacklist(Start,End)), generate_facts_the_newsroom_AND_the_blacklist(Tail).

the_newsroom_AND_the_blacklist_aux() :- findall((Start,End),the_newsroom(Start,End),Interval1), findall((Start,End),the_blacklist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_newsroom_AND_the_blacklist(Interval).

the_newsroom_AND_the_blacklist_at_2014(Res) :- setof((Start,End),the_newsroom_AND_the_blacklist(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = the_newsroom_AND_the_blacklist_at_2014'), (the_newsroom_AND_the_blacklist_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_newsroom_AND_the_blacklist_aux().

