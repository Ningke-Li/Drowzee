:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

battle_of_li_ge(Start,End) :- begin('battle_of_li_ge',_,_,Start), end('battle_of_li_ge',_,_,End), Start=<End.

generate_facts_underground_railroad_OR_battle_of_li_ge([]) :- assert(underground_railroad_OR_battle_of_li_ge(-1,-1)).

generate_facts_underground_railroad_OR_battle_of_li_ge([(Start,End) | Tail]) :- assert(underground_railroad_OR_battle_of_li_ge(Start,End)), generate_facts_underground_railroad_OR_battle_of_li_ge(Tail).

underground_railroad_OR_battle_of_li_ge_aux() :- findall((Start,End),underground_railroad(Start,End),Interval1), findall((Start,End),battle_of_li_ge(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_underground_railroad_OR_battle_of_li_ge(Interval).

underground_railroad_OR_battle_of_li_ge_at_1762(Res) :- setof((Start,End),underground_railroad_OR_battle_of_li_ge(Start,End),AllINtervals), checkvalidity(1762,AllINtervals,Res).

check_query() :- write('Query = underground_railroad_OR_battle_of_li_ge_at_1762'), (underground_railroad_OR_battle_of_li_ge_at_1762(true) -> write('\nRes   = true');write('\nRes   = false')).
?- underground_railroad_OR_battle_of_li_ge_aux().

