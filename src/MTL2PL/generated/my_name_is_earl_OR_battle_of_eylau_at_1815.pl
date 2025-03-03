:- include('database.pl').
my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

battle_of_eylau(Start,End) :- begin('battle_of_eylau',_,_,Start), end('battle_of_eylau',_,_,End), Start=<End.

generate_facts_my_name_is_earl_OR_battle_of_eylau([]) :- assert(my_name_is_earl_OR_battle_of_eylau(-1,-1)).

generate_facts_my_name_is_earl_OR_battle_of_eylau([(Start,End) | Tail]) :- assert(my_name_is_earl_OR_battle_of_eylau(Start,End)), generate_facts_my_name_is_earl_OR_battle_of_eylau(Tail).

my_name_is_earl_OR_battle_of_eylau_aux() :- findall((Start,End),my_name_is_earl(Start,End),Interval1), findall((Start,End),battle_of_eylau(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_my_name_is_earl_OR_battle_of_eylau(Interval).

my_name_is_earl_OR_battle_of_eylau_at_1815(Res) :- setof((Start,End),my_name_is_earl_OR_battle_of_eylau(Start,End),AllINtervals), checkvalidity(1815,AllINtervals,Res).

check_query() :- write('Query = my_name_is_earl_OR_battle_of_eylau_at_1815'), (my_name_is_earl_OR_battle_of_eylau_at_1815(true) -> write('\nRes   = true');write('\nRes   = false')).
?- my_name_is_earl_OR_battle_of_eylau_aux().

