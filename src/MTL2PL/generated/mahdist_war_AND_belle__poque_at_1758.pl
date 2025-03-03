:- include('database.pl').
mahdist_war(Start,End) :- begin('mahdist_war',_,_,Start), end('mahdist_war',_,_,End), Start=<End.

belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

generate_facts_mahdist_war_AND_belle__poque([]) :- assert(mahdist_war_AND_belle__poque(-1,-1)).

generate_facts_mahdist_war_AND_belle__poque([(Start,End) | Tail]) :- assert(mahdist_war_AND_belle__poque(Start,End)), generate_facts_mahdist_war_AND_belle__poque(Tail).

mahdist_war_AND_belle__poque_aux() :- findall((Start,End),mahdist_war(Start,End),Interval1), findall((Start,End),belle__poque(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mahdist_war_AND_belle__poque(Interval).

mahdist_war_AND_belle__poque_at_1758(Res) :- setof((Start,End),mahdist_war_AND_belle__poque(Start,End),AllINtervals), checkvalidity(1758,AllINtervals,Res).

check_query() :- write('Query = mahdist_war_AND_belle__poque_at_1758'), (mahdist_war_AND_belle__poque_at_1758(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mahdist_war_AND_belle__poque_aux().

