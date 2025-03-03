:- include('database.pl').
third_anglo_afghan_war(Start,End) :- begin('third_anglo_afghan_war',_,_,Start), end('third_anglo_afghan_war',_,_,End), Start=<End.

dae_jang_geum(Start,End) :- begin('dae_jang_geum',_,_,Start), end('dae_jang_geum',_,_,End), Start=<End.

generate_facts_third_anglo_afghan_war_OR_dae_jang_geum([]) :- assert(third_anglo_afghan_war_OR_dae_jang_geum(-1,-1)).

generate_facts_third_anglo_afghan_war_OR_dae_jang_geum([(Start,End) | Tail]) :- assert(third_anglo_afghan_war_OR_dae_jang_geum(Start,End)), generate_facts_third_anglo_afghan_war_OR_dae_jang_geum(Tail).

third_anglo_afghan_war_OR_dae_jang_geum_aux() :- findall((Start,End),third_anglo_afghan_war(Start,End),Interval1), findall((Start,End),dae_jang_geum(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_third_anglo_afghan_war_OR_dae_jang_geum(Interval).

third_anglo_afghan_war_OR_dae_jang_geum_at_2004(Res) :- setof((Start,End),third_anglo_afghan_war_OR_dae_jang_geum(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = third_anglo_afghan_war_OR_dae_jang_geum_at_2004'), (third_anglo_afghan_war_OR_dae_jang_geum_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- third_anglo_afghan_war_OR_dae_jang_geum_aux().

