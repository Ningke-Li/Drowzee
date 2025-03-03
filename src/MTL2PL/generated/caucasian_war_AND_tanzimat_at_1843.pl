:- include('database.pl').
caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

tanzimat(Start,End) :- begin('tanzimat',_,_,Start), end('tanzimat',_,_,End), Start=<End.

generate_facts_caucasian_war_AND_tanzimat([]) :- assert(caucasian_war_AND_tanzimat(-1,-1)).

generate_facts_caucasian_war_AND_tanzimat([(Start,End) | Tail]) :- assert(caucasian_war_AND_tanzimat(Start,End)), generate_facts_caucasian_war_AND_tanzimat(Tail).

caucasian_war_AND_tanzimat_aux() :- findall((Start,End),caucasian_war(Start,End),Interval1), findall((Start,End),tanzimat(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_caucasian_war_AND_tanzimat(Interval).

caucasian_war_AND_tanzimat_at_1843(Res) :- setof((Start,End),caucasian_war_AND_tanzimat(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = caucasian_war_AND_tanzimat_at_1843'), (caucasian_war_AND_tanzimat_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).
?- caucasian_war_AND_tanzimat_aux().

