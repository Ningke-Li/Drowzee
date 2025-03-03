:- include('database.pl').
war_communism(Start,End) :- begin('war_communism',_,_,Start), end('war_communism',_,_,End), Start=<End.

polish_ukrainian_war(Start,End) :- begin('polish_ukrainian_war',_,_,Start), end('polish_ukrainian_war',_,_,End), Start=<End.

generate_facts_war_communism_AND_polish_ukrainian_war([]) :- assert(war_communism_AND_polish_ukrainian_war(-1,-1)).

generate_facts_war_communism_AND_polish_ukrainian_war([(Start,End) | Tail]) :- assert(war_communism_AND_polish_ukrainian_war(Start,End)), generate_facts_war_communism_AND_polish_ukrainian_war(Tail).

war_communism_AND_polish_ukrainian_war_aux() :- findall((Start,End),war_communism(Start,End),Interval1), findall((Start,End),polish_ukrainian_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_communism_AND_polish_ukrainian_war(Interval).

war_communism_AND_polish_ukrainian_war_at_1910(Res) :- setof((Start,End),war_communism_AND_polish_ukrainian_war(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = war_communism_AND_polish_ukrainian_war_at_1910'), (war_communism_AND_polish_ukrainian_war_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_communism_AND_polish_ukrainian_war_aux().

