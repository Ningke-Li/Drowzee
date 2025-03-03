:- include('database.pl').
yalta_conference(Start,End) :- begin('yalta_conference',_,_,Start), end('yalta_conference',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

generate_facts_yalta_conference_OR_north_african_campaign([]) :- assert(yalta_conference_OR_north_african_campaign(-1,-1)).

generate_facts_yalta_conference_OR_north_african_campaign([(Start,End) | Tail]) :- assert(yalta_conference_OR_north_african_campaign(Start,End)), generate_facts_yalta_conference_OR_north_african_campaign(Tail).

yalta_conference_OR_north_african_campaign_aux() :- findall((Start,End),yalta_conference(Start,End),Interval1), findall((Start,End),north_african_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_yalta_conference_OR_north_african_campaign(Interval).

yalta_conference_OR_north_african_campaign_at_1941(Res) :- setof((Start,End),yalta_conference_OR_north_african_campaign(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = yalta_conference_OR_north_african_campaign_at_1941'), (yalta_conference_OR_north_african_campaign_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- yalta_conference_OR_north_african_campaign_aux().

