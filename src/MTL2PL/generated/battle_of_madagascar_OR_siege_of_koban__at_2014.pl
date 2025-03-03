:- include('database.pl').
battle_of_madagascar(Start,End) :- begin('battle_of_madagascar',_,_,Start), end('battle_of_madagascar',_,_,End), Start=<End.

siege_of_koban_(Start,End) :- begin('siege_of_koban_',_,_,Start), end('siege_of_koban_',_,_,End), Start=<End.

generate_facts_battle_of_madagascar_OR_siege_of_koban_([]) :- assert(battle_of_madagascar_OR_siege_of_koban_(-1,-1)).

generate_facts_battle_of_madagascar_OR_siege_of_koban_([(Start,End) | Tail]) :- assert(battle_of_madagascar_OR_siege_of_koban_(Start,End)), generate_facts_battle_of_madagascar_OR_siege_of_koban_(Tail).

battle_of_madagascar_OR_siege_of_koban__aux() :- findall((Start,End),battle_of_madagascar(Start,End),Interval1), findall((Start,End),siege_of_koban_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_madagascar_OR_siege_of_koban_(Interval).

battle_of_madagascar_OR_siege_of_koban__at_2014(Res) :- setof((Start,End),battle_of_madagascar_OR_siege_of_koban_(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = battle_of_madagascar_OR_siege_of_koban__at_2014'), (battle_of_madagascar_OR_siege_of_koban__at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_madagascar_OR_siege_of_koban__aux().

