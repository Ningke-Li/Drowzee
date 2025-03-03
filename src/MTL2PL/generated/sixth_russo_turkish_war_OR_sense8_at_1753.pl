:- include('database.pl').
sixth_russo_turkish_war(Start,End) :- begin('sixth_russo_turkish_war',_,_,Start), end('sixth_russo_turkish_war',_,_,End), Start=<End.

sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

generate_facts_sixth_russo_turkish_war_OR_sense8([]) :- assert(sixth_russo_turkish_war_OR_sense8(-1,-1)).

generate_facts_sixth_russo_turkish_war_OR_sense8([(Start,End) | Tail]) :- assert(sixth_russo_turkish_war_OR_sense8(Start,End)), generate_facts_sixth_russo_turkish_war_OR_sense8(Tail).

sixth_russo_turkish_war_OR_sense8_aux() :- findall((Start,End),sixth_russo_turkish_war(Start,End),Interval1), findall((Start,End),sense8(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sixth_russo_turkish_war_OR_sense8(Interval).

sixth_russo_turkish_war_OR_sense8_at_1753(Res) :- setof((Start,End),sixth_russo_turkish_war_OR_sense8(Start,End),AllINtervals), checkvalidity(1753,AllINtervals,Res).

check_query() :- write('Query = sixth_russo_turkish_war_OR_sense8_at_1753'), (sixth_russo_turkish_war_OR_sense8_at_1753(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sixth_russo_turkish_war_OR_sense8_aux().

