:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

battle_of_chancellorsville(Start,End) :- begin('battle_of_chancellorsville',_,_,Start), end('battle_of_chancellorsville',_,_,End), Start=<End.

generate_facts_czechoslovak_koruna_OR_battle_of_chancellorsville([]) :- assert(czechoslovak_koruna_OR_battle_of_chancellorsville(-1,-1)).

generate_facts_czechoslovak_koruna_OR_battle_of_chancellorsville([(Start,End) | Tail]) :- assert(czechoslovak_koruna_OR_battle_of_chancellorsville(Start,End)), generate_facts_czechoslovak_koruna_OR_battle_of_chancellorsville(Tail).

czechoslovak_koruna_OR_battle_of_chancellorsville_aux() :- findall((Start,End),czechoslovak_koruna(Start,End),Interval1), findall((Start,End),battle_of_chancellorsville(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_czechoslovak_koruna_OR_battle_of_chancellorsville(Interval).

czechoslovak_koruna_OR_battle_of_chancellorsville_at_1931(Res) :- setof((Start,End),czechoslovak_koruna_OR_battle_of_chancellorsville(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = czechoslovak_koruna_OR_battle_of_chancellorsville_at_1931'), (czechoslovak_koruna_OR_battle_of_chancellorsville_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).
?- czechoslovak_koruna_OR_battle_of_chancellorsville_aux().

