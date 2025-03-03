:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_OR_serbian_campaign([]) :- assert(enabling_act_of_1933_OR_serbian_campaign(-1,-1)).

generate_facts_enabling_act_of_1933_OR_serbian_campaign([(Start,End) | Tail]) :- assert(enabling_act_of_1933_OR_serbian_campaign(Start,End)), generate_facts_enabling_act_of_1933_OR_serbian_campaign(Tail).

enabling_act_of_1933_OR_serbian_campaign_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),serbian_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_OR_serbian_campaign(Interval).

enabling_act_of_1933_OR_serbian_campaign_at_1942(Res) :- setof((Start,End),enabling_act_of_1933_OR_serbian_campaign(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_OR_serbian_campaign_at_1942'), (enabling_act_of_1933_OR_serbian_campaign_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_OR_serbian_campaign_aux().

