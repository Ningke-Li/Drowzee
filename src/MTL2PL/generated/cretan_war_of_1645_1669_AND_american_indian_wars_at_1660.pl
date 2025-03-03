:- include('database.pl').
cretan_war_of_1645_1669(Start,End) :- begin('cretan_war_of_1645_1669',_,_,Start), end('cretan_war_of_1645_1669',_,_,End), Start=<End.

american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

generate_facts_cretan_war_of_1645_1669_AND_american_indian_wars([]) :- assert(cretan_war_of_1645_1669_AND_american_indian_wars(-1,-1)).

generate_facts_cretan_war_of_1645_1669_AND_american_indian_wars([(Start,End) | Tail]) :- assert(cretan_war_of_1645_1669_AND_american_indian_wars(Start,End)), generate_facts_cretan_war_of_1645_1669_AND_american_indian_wars(Tail).

cretan_war_of_1645_1669_AND_american_indian_wars_aux() :- findall((Start,End),cretan_war_of_1645_1669(Start,End),Interval1), findall((Start,End),american_indian_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_cretan_war_of_1645_1669_AND_american_indian_wars(Interval).

cretan_war_of_1645_1669_AND_american_indian_wars_at_1660(Res) :- setof((Start,End),cretan_war_of_1645_1669_AND_american_indian_wars(Start,End),AllINtervals), checkvalidity(1660,AllINtervals,Res).

check_query() :- write('Query = cretan_war_of_1645_1669_AND_american_indian_wars_at_1660'), (cretan_war_of_1645_1669_AND_american_indian_wars_at_1660(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cretan_war_of_1645_1669_AND_american_indian_wars_aux().

