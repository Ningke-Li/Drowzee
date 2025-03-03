:- include('database.pl').
ancien_r_gime(Start,End) :- begin('ancien_r_gime',_,_,Start), end('ancien_r_gime',_,_,End), Start=<End.

great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

generate_facts_ancien_r_gime_AND_great_northern_war([]) :- assert(ancien_r_gime_AND_great_northern_war(-1,-1)).

generate_facts_ancien_r_gime_AND_great_northern_war([(Start,End) | Tail]) :- assert(ancien_r_gime_AND_great_northern_war(Start,End)), generate_facts_ancien_r_gime_AND_great_northern_war(Tail).

ancien_r_gime_AND_great_northern_war_aux() :- findall((Start,End),ancien_r_gime(Start,End),Interval1), findall((Start,End),great_northern_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ancien_r_gime_AND_great_northern_war(Interval).

ancien_r_gime_AND_great_northern_war_at_1686(Res) :- setof((Start,End),ancien_r_gime_AND_great_northern_war(Start,End),AllINtervals), checkvalidity(1686,AllINtervals,Res).

check_query() :- write('Query = ancien_r_gime_AND_great_northern_war_at_1686'), (ancien_r_gime_AND_great_northern_war_at_1686(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ancien_r_gime_AND_great_northern_war_aux().

