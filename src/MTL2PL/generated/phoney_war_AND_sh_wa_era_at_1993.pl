:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

generate_facts_phoney_war_AND_sh_wa_era([]) :- assert(phoney_war_AND_sh_wa_era(-1,-1)).

generate_facts_phoney_war_AND_sh_wa_era([(Start,End) | Tail]) :- assert(phoney_war_AND_sh_wa_era(Start,End)), generate_facts_phoney_war_AND_sh_wa_era(Tail).

phoney_war_AND_sh_wa_era_aux() :- findall((Start,End),phoney_war(Start,End),Interval1), findall((Start,End),sh_wa_era(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phoney_war_AND_sh_wa_era(Interval).

phoney_war_AND_sh_wa_era_at_1993(Res) :- setof((Start,End),phoney_war_AND_sh_wa_era(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = phoney_war_AND_sh_wa_era_at_1993'), (phoney_war_AND_sh_wa_era_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phoney_war_AND_sh_wa_era_aux().

