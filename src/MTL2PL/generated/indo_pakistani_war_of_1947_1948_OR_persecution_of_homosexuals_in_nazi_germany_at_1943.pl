:- include('database.pl').
indo_pakistani_war_of_1947_1948(Start,End) :- begin('indo_pakistani_war_of_1947_1948',_,_,Start), end('indo_pakistani_war_of_1947_1948',_,_,End), Start=<End.

persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

generate_facts_indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany([]) :- assert(indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany(-1,-1)).

generate_facts_indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany([(Start,End) | Tail]) :- assert(indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany(Start,End)), generate_facts_indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany(Tail).

indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany_aux() :- findall((Start,End),indo_pakistani_war_of_1947_1948(Start,End),Interval1), findall((Start,End),persecution_of_homosexuals_in_nazi_germany(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany(Interval).

indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany_at_1943(Res) :- setof((Start,End),indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany_at_1943'), (indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- indo_pakistani_war_of_1947_1948_OR_persecution_of_homosexuals_in_nazi_germany_aux().

