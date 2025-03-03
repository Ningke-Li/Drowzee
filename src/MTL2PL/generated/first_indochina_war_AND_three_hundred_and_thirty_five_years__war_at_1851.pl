:- include('database.pl').
first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

generate_facts_first_indochina_war_AND_three_hundred_and_thirty_five_years__war([]) :- assert(first_indochina_war_AND_three_hundred_and_thirty_five_years__war(-1,-1)).

generate_facts_first_indochina_war_AND_three_hundred_and_thirty_five_years__war([(Start,End) | Tail]) :- assert(first_indochina_war_AND_three_hundred_and_thirty_five_years__war(Start,End)), generate_facts_first_indochina_war_AND_three_hundred_and_thirty_five_years__war(Tail).

first_indochina_war_AND_three_hundred_and_thirty_five_years__war_aux() :- findall((Start,End),first_indochina_war(Start,End),Interval1), findall((Start,End),three_hundred_and_thirty_five_years__war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_first_indochina_war_AND_three_hundred_and_thirty_five_years__war(Interval).

first_indochina_war_AND_three_hundred_and_thirty_five_years__war_at_1851(Res) :- setof((Start,End),first_indochina_war_AND_three_hundred_and_thirty_five_years__war(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = first_indochina_war_AND_three_hundred_and_thirty_five_years__war_at_1851'), (first_indochina_war_AND_three_hundred_and_thirty_five_years__war_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_indochina_war_AND_three_hundred_and_thirty_five_years__war_aux().

