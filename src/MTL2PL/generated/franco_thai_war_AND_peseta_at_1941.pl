:- include('database.pl').
franco_thai_war(Start,End) :- begin('franco_thai_war',_,_,Start), end('franco_thai_war',_,_,End), Start=<End.

peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

generate_facts_franco_thai_war_AND_peseta([]) :- assert(franco_thai_war_AND_peseta(-1,-1)).

generate_facts_franco_thai_war_AND_peseta([(Start,End) | Tail]) :- assert(franco_thai_war_AND_peseta(Start,End)), generate_facts_franco_thai_war_AND_peseta(Tail).

franco_thai_war_AND_peseta_aux() :- findall((Start,End),franco_thai_war(Start,End),Interval1), findall((Start,End),peseta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_franco_thai_war_AND_peseta(Interval).

franco_thai_war_AND_peseta_at_1941(Res) :- setof((Start,End),franco_thai_war_AND_peseta(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = franco_thai_war_AND_peseta_at_1941'), (franco_thai_war_AND_peseta_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- franco_thai_war_AND_peseta_aux().

