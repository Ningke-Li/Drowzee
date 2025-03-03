:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

livonian_war(Start,End) :- begin('livonian_war',_,_,Start), end('livonian_war',_,_,End), Start=<End.

generate_facts_the_good_wife_OR_livonian_war([]) :- assert(the_good_wife_OR_livonian_war(-1,-1)).

generate_facts_the_good_wife_OR_livonian_war([(Start,End) | Tail]) :- assert(the_good_wife_OR_livonian_war(Start,End)), generate_facts_the_good_wife_OR_livonian_war(Tail).

the_good_wife_OR_livonian_war_aux() :- findall((Start,End),the_good_wife(Start,End),Interval1), findall((Start,End),livonian_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_good_wife_OR_livonian_war(Interval).

the_good_wife_OR_livonian_war_at_2036(Res) :- setof((Start,End),the_good_wife_OR_livonian_war(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_OR_livonian_war_at_2036'), (the_good_wife_OR_livonian_war_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_wife_OR_livonian_war_aux().

