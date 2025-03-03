:- include('database.pl').
greco_turkish_war(Start,End) :- begin('greco_turkish_war',_,_,Start), end('greco_turkish_war',_,_,End), Start=<End.

siege_of_tobruk(Start,End) :- begin('siege_of_tobruk',_,_,Start), end('siege_of_tobruk',_,_,End), Start=<End.

generate_facts_greco_turkish_war_OR_siege_of_tobruk([]) :- assert(greco_turkish_war_OR_siege_of_tobruk(-1,-1)).

generate_facts_greco_turkish_war_OR_siege_of_tobruk([(Start,End) | Tail]) :- assert(greco_turkish_war_OR_siege_of_tobruk(Start,End)), generate_facts_greco_turkish_war_OR_siege_of_tobruk(Tail).

greco_turkish_war_OR_siege_of_tobruk_aux() :- findall((Start,End),greco_turkish_war(Start,End),Interval1), findall((Start,End),siege_of_tobruk(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greco_turkish_war_OR_siege_of_tobruk(Interval).

greco_turkish_war_OR_siege_of_tobruk_at_1915(Res) :- setof((Start,End),greco_turkish_war_OR_siege_of_tobruk(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = greco_turkish_war_OR_siege_of_tobruk_at_1915'), (greco_turkish_war_OR_siege_of_tobruk_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greco_turkish_war_OR_siege_of_tobruk_aux().

