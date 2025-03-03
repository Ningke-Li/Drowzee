:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

uefa_euro_2012(Start,End) :- begin('uefa_euro_2012',_,_,Start), end('uefa_euro_2012',_,_,End), Start=<End.

generate_facts_skins_OR_uefa_euro_2012([]) :- assert(skins_OR_uefa_euro_2012(-1,-1)).

generate_facts_skins_OR_uefa_euro_2012([(Start,End) | Tail]) :- assert(skins_OR_uefa_euro_2012(Start,End)), generate_facts_skins_OR_uefa_euro_2012(Tail).

skins_OR_uefa_euro_2012_aux() :- findall((Start,End),skins(Start,End),Interval1), findall((Start,End),uefa_euro_2012(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_skins_OR_uefa_euro_2012(Interval).

skins_OR_uefa_euro_2012_at_1893(Res) :- setof((Start,End),skins_OR_uefa_euro_2012(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = skins_OR_uefa_euro_2012_at_1893'), (skins_OR_uefa_euro_2012_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skins_OR_uefa_euro_2012_aux().

