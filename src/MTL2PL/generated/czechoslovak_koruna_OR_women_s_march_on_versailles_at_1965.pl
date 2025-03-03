:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

women_s_march_on_versailles(Start,End) :- begin('women_s_march_on_versailles',_,_,Start), end('women_s_march_on_versailles',_,_,End), Start=<End.

generate_facts_czechoslovak_koruna_OR_women_s_march_on_versailles([]) :- assert(czechoslovak_koruna_OR_women_s_march_on_versailles(-1,-1)).

generate_facts_czechoslovak_koruna_OR_women_s_march_on_versailles([(Start,End) | Tail]) :- assert(czechoslovak_koruna_OR_women_s_march_on_versailles(Start,End)), generate_facts_czechoslovak_koruna_OR_women_s_march_on_versailles(Tail).

czechoslovak_koruna_OR_women_s_march_on_versailles_aux() :- findall((Start,End),czechoslovak_koruna(Start,End),Interval1), findall((Start,End),women_s_march_on_versailles(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_czechoslovak_koruna_OR_women_s_march_on_versailles(Interval).

czechoslovak_koruna_OR_women_s_march_on_versailles_at_1965(Res) :- setof((Start,End),czechoslovak_koruna_OR_women_s_march_on_versailles(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = czechoslovak_koruna_OR_women_s_march_on_versailles_at_1965'), (czechoslovak_koruna_OR_women_s_march_on_versailles_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).
?- czechoslovak_koruna_OR_women_s_march_on_versailles_aux().

