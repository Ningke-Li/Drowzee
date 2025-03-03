:- include('database.pl').
surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

generate_facts_surrealism_AND_persecution_of_homosexuals_in_nazi_germany([]) :- assert(surrealism_AND_persecution_of_homosexuals_in_nazi_germany(-1,-1)).

generate_facts_surrealism_AND_persecution_of_homosexuals_in_nazi_germany([(Start,End) | Tail]) :- assert(surrealism_AND_persecution_of_homosexuals_in_nazi_germany(Start,End)), generate_facts_surrealism_AND_persecution_of_homosexuals_in_nazi_germany(Tail).

surrealism_AND_persecution_of_homosexuals_in_nazi_germany_aux() :- findall((Start,End),surrealism(Start,End),Interval1), findall((Start,End),persecution_of_homosexuals_in_nazi_germany(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_surrealism_AND_persecution_of_homosexuals_in_nazi_germany(Interval).

surrealism_AND_persecution_of_homosexuals_in_nazi_germany_at_1828(Res) :- setof((Start,End),surrealism_AND_persecution_of_homosexuals_in_nazi_germany(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = surrealism_AND_persecution_of_homosexuals_in_nazi_germany_at_1828'), (surrealism_AND_persecution_of_homosexuals_in_nazi_germany_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).
?- surrealism_AND_persecution_of_homosexuals_in_nazi_germany_aux().

