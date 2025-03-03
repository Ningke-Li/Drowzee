:- include('database.pl').
first_italo_ethiopian_war(Start,End) :- begin('first_italo_ethiopian_war',_,_,Start), end('first_italo_ethiopian_war',_,_,End), Start=<End.

literary_realism(Start,End) :- begin('literary_realism',_,_,Start), end('literary_realism',_,_,End), Start=<End.

generate_facts_first_italo_ethiopian_war_AND_literary_realism([]) :- assert(first_italo_ethiopian_war_AND_literary_realism(-1,-1)).

generate_facts_first_italo_ethiopian_war_AND_literary_realism([(Start,End) | Tail]) :- assert(first_italo_ethiopian_war_AND_literary_realism(Start,End)), generate_facts_first_italo_ethiopian_war_AND_literary_realism(Tail).

first_italo_ethiopian_war_AND_literary_realism_aux() :- findall((Start,End),first_italo_ethiopian_war(Start,End),Interval1), findall((Start,End),literary_realism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_first_italo_ethiopian_war_AND_literary_realism(Interval).

first_italo_ethiopian_war_AND_literary_realism_at_1895(Res) :- setof((Start,End),first_italo_ethiopian_war_AND_literary_realism(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = first_italo_ethiopian_war_AND_literary_realism_at_1895'), (first_italo_ethiopian_war_AND_literary_realism_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_italo_ethiopian_war_AND_literary_realism_aux().

