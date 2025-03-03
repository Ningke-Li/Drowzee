:- include('database.pl').
fifth_russo_turkish_war(Start,End) :- begin('fifth_russo_turkish_war',_,_,Start), end('fifth_russo_turkish_war',_,_,End), Start=<End.

monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

generate_facts_fifth_russo_turkish_war_OR_monk([]) :- assert(fifth_russo_turkish_war_OR_monk(-1,-1)).

generate_facts_fifth_russo_turkish_war_OR_monk([(Start,End) | Tail]) :- assert(fifth_russo_turkish_war_OR_monk(Start,End)), generate_facts_fifth_russo_turkish_war_OR_monk(Tail).

fifth_russo_turkish_war_OR_monk_aux() :- findall((Start,End),fifth_russo_turkish_war(Start,End),Interval1), findall((Start,End),monk(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fifth_russo_turkish_war_OR_monk(Interval).

fifth_russo_turkish_war_OR_monk_at_1750(Res) :- setof((Start,End),fifth_russo_turkish_war_OR_monk(Start,End),AllINtervals), checkvalidity(1750,AllINtervals,Res).

check_query() :- write('Query = fifth_russo_turkish_war_OR_monk_at_1750'), (fifth_russo_turkish_war_OR_monk_at_1750(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fifth_russo_turkish_war_OR_monk_aux().

