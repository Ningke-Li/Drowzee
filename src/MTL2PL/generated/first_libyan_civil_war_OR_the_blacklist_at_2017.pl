:- include('database.pl').
first_libyan_civil_war(Start,End) :- begin('first_libyan_civil_war',_,_,Start), end('first_libyan_civil_war',_,_,End), Start=<End.

the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

generate_facts_first_libyan_civil_war_OR_the_blacklist([]) :- assert(first_libyan_civil_war_OR_the_blacklist(-1,-1)).

generate_facts_first_libyan_civil_war_OR_the_blacklist([(Start,End) | Tail]) :- assert(first_libyan_civil_war_OR_the_blacklist(Start,End)), generate_facts_first_libyan_civil_war_OR_the_blacklist(Tail).

first_libyan_civil_war_OR_the_blacklist_aux() :- findall((Start,End),first_libyan_civil_war(Start,End),Interval1), findall((Start,End),the_blacklist(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_libyan_civil_war_OR_the_blacklist(Interval).

first_libyan_civil_war_OR_the_blacklist_at_2017(Res) :- setof((Start,End),first_libyan_civil_war_OR_the_blacklist(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = first_libyan_civil_war_OR_the_blacklist_at_2017'), (first_libyan_civil_war_OR_the_blacklist_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_libyan_civil_war_OR_the_blacklist_aux().

