:- include('database.pl').
caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

generate_facts_caucasian_war_AND_greek_drachma([]) :- assert(caucasian_war_AND_greek_drachma(-1,-1)).

generate_facts_caucasian_war_AND_greek_drachma([(Start,End) | Tail]) :- assert(caucasian_war_AND_greek_drachma(Start,End)), generate_facts_caucasian_war_AND_greek_drachma(Tail).

caucasian_war_AND_greek_drachma_aux() :- findall((Start,End),caucasian_war(Start,End),Interval1), findall((Start,End),greek_drachma(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_caucasian_war_AND_greek_drachma(Interval).

caucasian_war_AND_greek_drachma_at_1844(Res) :- setof((Start,End),caucasian_war_AND_greek_drachma(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = caucasian_war_AND_greek_drachma_at_1844'), (caucasian_war_AND_greek_drachma_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).
?- caucasian_war_AND_greek_drachma_aux().

