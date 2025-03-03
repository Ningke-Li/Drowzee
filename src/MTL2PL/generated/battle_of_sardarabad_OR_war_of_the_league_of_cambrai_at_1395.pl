:- include('database.pl').
battle_of_sardarabad(Start,End) :- begin('battle_of_sardarabad',_,_,Start), end('battle_of_sardarabad',_,_,End), Start=<End.

war_of_the_league_of_cambrai(Start,End) :- begin('war_of_the_league_of_cambrai',_,_,Start), end('war_of_the_league_of_cambrai',_,_,End), Start=<End.

generate_facts_battle_of_sardarabad_OR_war_of_the_league_of_cambrai([]) :- assert(battle_of_sardarabad_OR_war_of_the_league_of_cambrai(-1,-1)).

generate_facts_battle_of_sardarabad_OR_war_of_the_league_of_cambrai([(Start,End) | Tail]) :- assert(battle_of_sardarabad_OR_war_of_the_league_of_cambrai(Start,End)), generate_facts_battle_of_sardarabad_OR_war_of_the_league_of_cambrai(Tail).

battle_of_sardarabad_OR_war_of_the_league_of_cambrai_aux() :- findall((Start,End),battle_of_sardarabad(Start,End),Interval1), findall((Start,End),war_of_the_league_of_cambrai(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_sardarabad_OR_war_of_the_league_of_cambrai(Interval).

battle_of_sardarabad_OR_war_of_the_league_of_cambrai_at_1395(Res) :- setof((Start,End),battle_of_sardarabad_OR_war_of_the_league_of_cambrai(Start,End),AllINtervals), checkvalidity(1395,AllINtervals,Res).

check_query() :- write('Query = battle_of_sardarabad_OR_war_of_the_league_of_cambrai_at_1395'), (battle_of_sardarabad_OR_war_of_the_league_of_cambrai_at_1395(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_sardarabad_OR_war_of_the_league_of_cambrai_aux().

