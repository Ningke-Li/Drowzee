:- include('database.pl').
tunisian_revolution(Start,End) :- begin('tunisian_revolution',_,_,Start), end('tunisian_revolution',_,_,End), Start=<End.

cretan_war_of_1645_1669(Start,End) :- begin('cretan_war_of_1645_1669',_,_,Start), end('cretan_war_of_1645_1669',_,_,End), Start=<End.

generate_facts_tunisian_revolution_OR_cretan_war_of_1645_1669([]) :- assert(tunisian_revolution_OR_cretan_war_of_1645_1669(-1,-1)).

generate_facts_tunisian_revolution_OR_cretan_war_of_1645_1669([(Start,End) | Tail]) :- assert(tunisian_revolution_OR_cretan_war_of_1645_1669(Start,End)), generate_facts_tunisian_revolution_OR_cretan_war_of_1645_1669(Tail).

tunisian_revolution_OR_cretan_war_of_1645_1669_aux() :- findall((Start,End),tunisian_revolution(Start,End),Interval1), findall((Start,End),cretan_war_of_1645_1669(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tunisian_revolution_OR_cretan_war_of_1645_1669(Interval).

tunisian_revolution_OR_cretan_war_of_1645_1669_at_1604(Res) :- setof((Start,End),tunisian_revolution_OR_cretan_war_of_1645_1669(Start,End),AllINtervals), checkvalidity(1604,AllINtervals,Res).

check_query() :- write('Query = tunisian_revolution_OR_cretan_war_of_1645_1669_at_1604'), (tunisian_revolution_OR_cretan_war_of_1645_1669_at_1604(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tunisian_revolution_OR_cretan_war_of_1645_1669_aux().

