:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

polish_soviet_war(Start,End) :- begin('polish_soviet_war',_,_,Start), end('polish_soviet_war',_,_,End), Start=<End.

generate_facts_new_imperialism_AND_polish_soviet_war([]) :- assert(new_imperialism_AND_polish_soviet_war(-1,-1)).

generate_facts_new_imperialism_AND_polish_soviet_war([(Start,End) | Tail]) :- assert(new_imperialism_AND_polish_soviet_war(Start,End)), generate_facts_new_imperialism_AND_polish_soviet_war(Tail).

new_imperialism_AND_polish_soviet_war_aux() :- findall((Start,End),new_imperialism(Start,End),Interval1), findall((Start,End),polish_soviet_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_imperialism_AND_polish_soviet_war(Interval).

new_imperialism_AND_polish_soviet_war_at_1919(Res) :- setof((Start,End),new_imperialism_AND_polish_soviet_war(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_AND_polish_soviet_war_at_1919'), (new_imperialism_AND_polish_soviet_war_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_imperialism_AND_polish_soviet_war_aux().

