:- include('database.pl').
lapland_war(Start,End) :- begin('lapland_war',_,_,Start), end('lapland_war',_,_,End), Start=<End.

porajmos(Start,End) :- begin('porajmos',_,_,Start), end('porajmos',_,_,End), Start=<End.

generate_facts_lapland_war_AND_porajmos([]) :- assert(lapland_war_AND_porajmos(-1,-1)).

generate_facts_lapland_war_AND_porajmos([(Start,End) | Tail]) :- assert(lapland_war_AND_porajmos(Start,End)), generate_facts_lapland_war_AND_porajmos(Tail).

lapland_war_AND_porajmos_aux() :- findall((Start,End),lapland_war(Start,End),Interval1), findall((Start,End),porajmos(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lapland_war_AND_porajmos(Interval).

lapland_war_AND_porajmos_at_1817(Res) :- setof((Start,End),lapland_war_AND_porajmos(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = lapland_war_AND_porajmos_at_1817'), (lapland_war_AND_porajmos_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lapland_war_AND_porajmos_aux().

