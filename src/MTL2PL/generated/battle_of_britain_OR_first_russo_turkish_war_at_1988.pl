:- include('database.pl').
battle_of_britain(Start,End) :- begin('battle_of_britain',_,_,Start), end('battle_of_britain',_,_,End), Start=<End.

first_russo_turkish_war(Start,End) :- begin('first_russo_turkish_war',_,_,Start), end('first_russo_turkish_war',_,_,End), Start=<End.

generate_facts_battle_of_britain_OR_first_russo_turkish_war([]) :- assert(battle_of_britain_OR_first_russo_turkish_war(-1,-1)).

generate_facts_battle_of_britain_OR_first_russo_turkish_war([(Start,End) | Tail]) :- assert(battle_of_britain_OR_first_russo_turkish_war(Start,End)), generate_facts_battle_of_britain_OR_first_russo_turkish_war(Tail).

battle_of_britain_OR_first_russo_turkish_war_aux() :- findall((Start,End),battle_of_britain(Start,End),Interval1), findall((Start,End),first_russo_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_britain_OR_first_russo_turkish_war(Interval).

battle_of_britain_OR_first_russo_turkish_war_at_1988(Res) :- setof((Start,End),battle_of_britain_OR_first_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = battle_of_britain_OR_first_russo_turkish_war_at_1988'), (battle_of_britain_OR_first_russo_turkish_war_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_britain_OR_first_russo_turkish_war_aux().

