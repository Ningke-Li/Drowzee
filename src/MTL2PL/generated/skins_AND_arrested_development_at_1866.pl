:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

generate_facts_skins_AND_arrested_development([]) :- assert(skins_AND_arrested_development(-1,-1)).

generate_facts_skins_AND_arrested_development([(Start,End) | Tail]) :- assert(skins_AND_arrested_development(Start,End)), generate_facts_skins_AND_arrested_development(Tail).

skins_AND_arrested_development_aux() :- findall((Start,End),skins(Start,End),Interval1), findall((Start,End),arrested_development(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_skins_AND_arrested_development(Interval).

skins_AND_arrested_development_at_1866(Res) :- setof((Start,End),skins_AND_arrested_development(Start,End),AllINtervals), checkvalidity(1866,AllINtervals,Res).

check_query() :- write('Query = skins_AND_arrested_development_at_1866'), (skins_AND_arrested_development_at_1866(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skins_AND_arrested_development_aux().

