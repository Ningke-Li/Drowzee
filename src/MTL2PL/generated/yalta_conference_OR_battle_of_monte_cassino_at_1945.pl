:- include('database.pl').
yalta_conference(Start,End) :- begin('yalta_conference',_,_,Start), end('yalta_conference',_,_,End), Start=<End.

battle_of_monte_cassino(Start,End) :- begin('battle_of_monte_cassino',_,_,Start), end('battle_of_monte_cassino',_,_,End), Start=<End.

generate_facts_yalta_conference_OR_battle_of_monte_cassino([]) :- assert(yalta_conference_OR_battle_of_monte_cassino(-1,-1)).

generate_facts_yalta_conference_OR_battle_of_monte_cassino([(Start,End) | Tail]) :- assert(yalta_conference_OR_battle_of_monte_cassino(Start,End)), generate_facts_yalta_conference_OR_battle_of_monte_cassino(Tail).

yalta_conference_OR_battle_of_monte_cassino_aux() :- findall((Start,End),yalta_conference(Start,End),Interval1), findall((Start,End),battle_of_monte_cassino(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_yalta_conference_OR_battle_of_monte_cassino(Interval).

yalta_conference_OR_battle_of_monte_cassino_at_1945(Res) :- setof((Start,End),yalta_conference_OR_battle_of_monte_cassino(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = yalta_conference_OR_battle_of_monte_cassino_at_1945'), (yalta_conference_OR_battle_of_monte_cassino_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- yalta_conference_OR_battle_of_monte_cassino_aux().

