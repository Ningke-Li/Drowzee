:- include('database.pl').
april_2015(Start,End) :- begin('april_2015',_,_,Start), end('april_2015',_,_,End), Start=<End.

russo_japanese_war(Start,End) :- begin('russo_japanese_war',_,_,Start), end('russo_japanese_war',_,_,End), Start=<End.

generate_facts_april_2015_OR_russo_japanese_war([]) :- assert(april_2015_OR_russo_japanese_war(-1,-1)).

generate_facts_april_2015_OR_russo_japanese_war([(Start,End) | Tail]) :- assert(april_2015_OR_russo_japanese_war(Start,End)), generate_facts_april_2015_OR_russo_japanese_war(Tail).

april_2015_OR_russo_japanese_war_aux() :- findall((Start,End),april_2015(Start,End),Interval1), findall((Start,End),russo_japanese_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_april_2015_OR_russo_japanese_war(Interval).

april_2015_OR_russo_japanese_war_at_1863(Res) :- setof((Start,End),april_2015_OR_russo_japanese_war(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = april_2015_OR_russo_japanese_war_at_1863'), (april_2015_OR_russo_japanese_war_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- april_2015_OR_russo_japanese_war_aux().

