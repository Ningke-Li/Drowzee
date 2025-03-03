:- include('database.pl').
hannibal(Start,End) :- begin('hannibal',_,_,Start), end('hannibal',_,_,End), Start=<End.

the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

generate_facts_hannibal_AND_the_blacklist([]) :- assert(hannibal_AND_the_blacklist(-1,-1)).

generate_facts_hannibal_AND_the_blacklist([(Start,End) | Tail]) :- assert(hannibal_AND_the_blacklist(Start,End)), generate_facts_hannibal_AND_the_blacklist(Tail).

hannibal_AND_the_blacklist_aux() :- findall((Start,End),hannibal(Start,End),Interval1), findall((Start,End),the_blacklist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_hannibal_AND_the_blacklist(Interval).

hannibal_AND_the_blacklist_at_2014(Res) :- setof((Start,End),hannibal_AND_the_blacklist(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = hannibal_AND_the_blacklist_at_2014'), (hannibal_AND_the_blacklist_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hannibal_AND_the_blacklist_aux().

