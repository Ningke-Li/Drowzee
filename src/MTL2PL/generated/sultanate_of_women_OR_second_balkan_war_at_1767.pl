:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

second_balkan_war(Start,End) :- begin('second_balkan_war',_,_,Start), end('second_balkan_war',_,_,End), Start=<End.

generate_facts_sultanate_of_women_OR_second_balkan_war([]) :- assert(sultanate_of_women_OR_second_balkan_war(-1,-1)).

generate_facts_sultanate_of_women_OR_second_balkan_war([(Start,End) | Tail]) :- assert(sultanate_of_women_OR_second_balkan_war(Start,End)), generate_facts_sultanate_of_women_OR_second_balkan_war(Tail).

sultanate_of_women_OR_second_balkan_war_aux() :- findall((Start,End),sultanate_of_women(Start,End),Interval1), findall((Start,End),second_balkan_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sultanate_of_women_OR_second_balkan_war(Interval).

sultanate_of_women_OR_second_balkan_war_at_1767(Res) :- setof((Start,End),sultanate_of_women_OR_second_balkan_war(Start,End),AllINtervals), checkvalidity(1767,AllINtervals,Res).

check_query() :- write('Query = sultanate_of_women_OR_second_balkan_war_at_1767'), (sultanate_of_women_OR_second_balkan_war_at_1767(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sultanate_of_women_OR_second_balkan_war_aux().

