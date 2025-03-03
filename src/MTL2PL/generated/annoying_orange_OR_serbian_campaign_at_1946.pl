:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

generate_facts_annoying_orange_OR_serbian_campaign([]) :- assert(annoying_orange_OR_serbian_campaign(-1,-1)).

generate_facts_annoying_orange_OR_serbian_campaign([(Start,End) | Tail]) :- assert(annoying_orange_OR_serbian_campaign(Start,End)), generate_facts_annoying_orange_OR_serbian_campaign(Tail).

annoying_orange_OR_serbian_campaign_aux() :- findall((Start,End),annoying_orange(Start,End),Interval1), findall((Start,End),serbian_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_annoying_orange_OR_serbian_campaign(Interval).

annoying_orange_OR_serbian_campaign_at_1946(Res) :- setof((Start,End),annoying_orange_OR_serbian_campaign(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_OR_serbian_campaign_at_1946'), (annoying_orange_OR_serbian_campaign_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- annoying_orange_OR_serbian_campaign_aux().

