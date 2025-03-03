:- include('database.pl').
mexican_american_war(Start,End) :- begin('mexican_american_war',_,_,Start), end('mexican_american_war',_,_,End), Start=<End.

first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

generate_facts_mexican_american_war_OR_first_wave_feminism([]) :- assert(mexican_american_war_OR_first_wave_feminism(-1,-1)).

generate_facts_mexican_american_war_OR_first_wave_feminism([(Start,End) | Tail]) :- assert(mexican_american_war_OR_first_wave_feminism(Start,End)), generate_facts_mexican_american_war_OR_first_wave_feminism(Tail).

mexican_american_war_OR_first_wave_feminism_aux() :- findall((Start,End),mexican_american_war(Start,End),Interval1), findall((Start,End),first_wave_feminism(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mexican_american_war_OR_first_wave_feminism(Interval).

mexican_american_war_OR_first_wave_feminism_at_1792(Res) :- setof((Start,End),mexican_american_war_OR_first_wave_feminism(Start,End),AllINtervals), checkvalidity(1792,AllINtervals,Res).

check_query() :- write('Query = mexican_american_war_OR_first_wave_feminism_at_1792'), (mexican_american_war_OR_first_wave_feminism_at_1792(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mexican_american_war_OR_first_wave_feminism_aux().

