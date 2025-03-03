:- include('database.pl').
sputnik_programme(Start,End) :- begin('sputnik_programme',_,_,Start), end('sputnik_programme',_,_,End), Start=<End.

sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

generate_facts_sputnik_programme_AND_sh_wa_era([]) :- assert(sputnik_programme_AND_sh_wa_era(-1,-1)).

generate_facts_sputnik_programme_AND_sh_wa_era([(Start,End) | Tail]) :- assert(sputnik_programme_AND_sh_wa_era(Start,End)), generate_facts_sputnik_programme_AND_sh_wa_era(Tail).

sputnik_programme_AND_sh_wa_era_aux() :- findall((Start,End),sputnik_programme(Start,End),Interval1), findall((Start,End),sh_wa_era(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sputnik_programme_AND_sh_wa_era(Interval).

sputnik_programme_AND_sh_wa_era_at_1871(Res) :- setof((Start,End),sputnik_programme_AND_sh_wa_era(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = sputnik_programme_AND_sh_wa_era_at_1871'), (sputnik_programme_AND_sh_wa_era_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sputnik_programme_AND_sh_wa_era_aux().

