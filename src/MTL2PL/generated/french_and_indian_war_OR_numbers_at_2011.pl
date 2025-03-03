:- include('database.pl').
french_and_indian_war(Start,End) :- begin('french_and_indian_war',_,_,Start), end('french_and_indian_war',_,_,End), Start=<End.

numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

generate_facts_french_and_indian_war_OR_numbers([]) :- assert(french_and_indian_war_OR_numbers(-1,-1)).

generate_facts_french_and_indian_war_OR_numbers([(Start,End) | Tail]) :- assert(french_and_indian_war_OR_numbers(Start,End)), generate_facts_french_and_indian_war_OR_numbers(Tail).

french_and_indian_war_OR_numbers_aux() :- findall((Start,End),french_and_indian_war(Start,End),Interval1), findall((Start,End),numbers(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_french_and_indian_war_OR_numbers(Interval).

french_and_indian_war_OR_numbers_at_2011(Res) :- setof((Start,End),french_and_indian_war_OR_numbers(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = french_and_indian_war_OR_numbers_at_2011'), (french_and_indian_war_OR_numbers_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_and_indian_war_OR_numbers_aux().

