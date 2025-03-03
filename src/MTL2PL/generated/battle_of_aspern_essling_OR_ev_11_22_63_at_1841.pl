:- include('database.pl').
battle_of_aspern_essling(Start,End) :- begin('battle_of_aspern_essling',_,_,Start), end('battle_of_aspern_essling',_,_,End), Start=<End.

ev_11_22_63(Start,End) :- begin('ev_11_22_63',_,_,Start), end('ev_11_22_63',_,_,End), Start=<End.

generate_facts_battle_of_aspern_essling_OR_ev_11_22_63([]) :- assert(battle_of_aspern_essling_OR_ev_11_22_63(-1,-1)).

generate_facts_battle_of_aspern_essling_OR_ev_11_22_63([(Start,End) | Tail]) :- assert(battle_of_aspern_essling_OR_ev_11_22_63(Start,End)), generate_facts_battle_of_aspern_essling_OR_ev_11_22_63(Tail).

battle_of_aspern_essling_OR_ev_11_22_63_aux() :- findall((Start,End),battle_of_aspern_essling(Start,End),Interval1), findall((Start,End),ev_11_22_63(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_aspern_essling_OR_ev_11_22_63(Interval).

battle_of_aspern_essling_OR_ev_11_22_63_at_1841(Res) :- setof((Start,End),battle_of_aspern_essling_OR_ev_11_22_63(Start,End),AllINtervals), checkvalidity(1841,AllINtervals,Res).

check_query() :- write('Query = battle_of_aspern_essling_OR_ev_11_22_63_at_1841'), (battle_of_aspern_essling_OR_ev_11_22_63_at_1841(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_aspern_essling_OR_ev_11_22_63_aux().

