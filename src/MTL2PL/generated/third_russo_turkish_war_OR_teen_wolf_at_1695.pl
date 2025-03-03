:- include('database.pl').
third_russo_turkish_war(Start,End) :- begin('third_russo_turkish_war',_,_,Start), end('third_russo_turkish_war',_,_,End), Start=<End.

teen_wolf(Start,End) :- begin('teen_wolf',_,_,Start), end('teen_wolf',_,_,End), Start=<End.

generate_facts_third_russo_turkish_war_OR_teen_wolf([]) :- assert(third_russo_turkish_war_OR_teen_wolf(-1,-1)).

generate_facts_third_russo_turkish_war_OR_teen_wolf([(Start,End) | Tail]) :- assert(third_russo_turkish_war_OR_teen_wolf(Start,End)), generate_facts_third_russo_turkish_war_OR_teen_wolf(Tail).

third_russo_turkish_war_OR_teen_wolf_aux() :- findall((Start,End),third_russo_turkish_war(Start,End),Interval1), findall((Start,End),teen_wolf(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_third_russo_turkish_war_OR_teen_wolf(Interval).

third_russo_turkish_war_OR_teen_wolf_at_1695(Res) :- setof((Start,End),third_russo_turkish_war_OR_teen_wolf(Start,End),AllINtervals), checkvalidity(1695,AllINtervals,Res).

check_query() :- write('Query = third_russo_turkish_war_OR_teen_wolf_at_1695'), (third_russo_turkish_war_OR_teen_wolf_at_1695(true) -> write('\nRes   = true');write('\nRes   = false')).
?- third_russo_turkish_war_OR_teen_wolf_aux().

