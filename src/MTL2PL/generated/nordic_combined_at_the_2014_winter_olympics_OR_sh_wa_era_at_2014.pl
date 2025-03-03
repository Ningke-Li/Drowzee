:- include('database.pl').
nordic_combined_at_the_2014_winter_olympics(Start,End) :- begin('nordic_combined_at_the_2014_winter_olympics',_,_,Start), end('nordic_combined_at_the_2014_winter_olympics',_,_,End), Start=<End.

sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

generate_facts_nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era([]) :- assert(nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era(-1,-1)).

generate_facts_nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era([(Start,End) | Tail]) :- assert(nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era(Start,End)), generate_facts_nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era(Tail).

nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era_aux() :- findall((Start,End),nordic_combined_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),sh_wa_era(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era(Interval).

nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era_at_2014(Res) :- setof((Start,End),nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era_at_2014'), (nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nordic_combined_at_the_2014_winter_olympics_OR_sh_wa_era_aux().

