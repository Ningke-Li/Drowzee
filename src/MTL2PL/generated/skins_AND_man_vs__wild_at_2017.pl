:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

generate_facts_skins_AND_man_vs__wild([]) :- assert(skins_AND_man_vs__wild(-1,-1)).

generate_facts_skins_AND_man_vs__wild([(Start,End) | Tail]) :- assert(skins_AND_man_vs__wild(Start,End)), generate_facts_skins_AND_man_vs__wild(Tail).

skins_AND_man_vs__wild_aux() :- findall((Start,End),skins(Start,End),Interval1), findall((Start,End),man_vs__wild(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_skins_AND_man_vs__wild(Interval).

skins_AND_man_vs__wild_at_2017(Res) :- setof((Start,End),skins_AND_man_vs__wild(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = skins_AND_man_vs__wild_at_2017'), (skins_AND_man_vs__wild_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skins_AND_man_vs__wild_aux().

