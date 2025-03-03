:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

ninth_russo_turkish_war(Start,End) :- begin('ninth_russo_turkish_war',_,_,Start), end('ninth_russo_turkish_war',_,_,End), Start=<End.

generate_facts_soul_eater_OR_ninth_russo_turkish_war([]) :- assert(soul_eater_OR_ninth_russo_turkish_war(-1,-1)).

generate_facts_soul_eater_OR_ninth_russo_turkish_war([(Start,End) | Tail]) :- assert(soul_eater_OR_ninth_russo_turkish_war(Start,End)), generate_facts_soul_eater_OR_ninth_russo_turkish_war(Tail).

soul_eater_OR_ninth_russo_turkish_war_aux() :- findall((Start,End),soul_eater(Start,End),Interval1), findall((Start,End),ninth_russo_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_soul_eater_OR_ninth_russo_turkish_war(Interval).

soul_eater_OR_ninth_russo_turkish_war_at_1848(Res) :- setof((Start,End),soul_eater_OR_ninth_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = soul_eater_OR_ninth_russo_turkish_war_at_1848'), (soul_eater_OR_ninth_russo_turkish_war_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soul_eater_OR_ninth_russo_turkish_war_aux().

