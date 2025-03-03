:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

irish_war_of_independence(Start,End) :- begin('irish_war_of_independence',_,_,Start), end('irish_war_of_independence',_,_,End), Start=<End.

generate_facts_czechoslovak_koruna_AND_irish_war_of_independence([]) :- assert(czechoslovak_koruna_AND_irish_war_of_independence(-1,-1)).

generate_facts_czechoslovak_koruna_AND_irish_war_of_independence([(Start,End) | Tail]) :- assert(czechoslovak_koruna_AND_irish_war_of_independence(Start,End)), generate_facts_czechoslovak_koruna_AND_irish_war_of_independence(Tail).

czechoslovak_koruna_AND_irish_war_of_independence_aux() :- findall((Start,End),czechoslovak_koruna(Start,End),Interval1), findall((Start,End),irish_war_of_independence(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_czechoslovak_koruna_AND_irish_war_of_independence(Interval).

czechoslovak_koruna_AND_irish_war_of_independence_at_1935(Res) :- setof((Start,End),czechoslovak_koruna_AND_irish_war_of_independence(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = czechoslovak_koruna_AND_irish_war_of_independence_at_1935'), (czechoslovak_koruna_AND_irish_war_of_independence_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- czechoslovak_koruna_AND_irish_war_of_independence_aux().

