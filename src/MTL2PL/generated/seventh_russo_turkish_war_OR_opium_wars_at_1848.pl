:- include('database.pl').
seventh_russo_turkish_war(Start,End) :- begin('seventh_russo_turkish_war',_,_,Start), end('seventh_russo_turkish_war',_,_,End), Start=<End.

opium_wars(Start,End) :- begin('opium_wars',_,_,Start), end('opium_wars',_,_,End), Start=<End.

generate_facts_seventh_russo_turkish_war_OR_opium_wars([]) :- assert(seventh_russo_turkish_war_OR_opium_wars(-1,-1)).

generate_facts_seventh_russo_turkish_war_OR_opium_wars([(Start,End) | Tail]) :- assert(seventh_russo_turkish_war_OR_opium_wars(Start,End)), generate_facts_seventh_russo_turkish_war_OR_opium_wars(Tail).

seventh_russo_turkish_war_OR_opium_wars_aux() :- findall((Start,End),seventh_russo_turkish_war(Start,End),Interval1), findall((Start,End),opium_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_seventh_russo_turkish_war_OR_opium_wars(Interval).

seventh_russo_turkish_war_OR_opium_wars_at_1848(Res) :- setof((Start,End),seventh_russo_turkish_war_OR_opium_wars(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = seventh_russo_turkish_war_OR_opium_wars_at_1848'), (seventh_russo_turkish_war_OR_opium_wars_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).
?- seventh_russo_turkish_war_OR_opium_wars_aux().

