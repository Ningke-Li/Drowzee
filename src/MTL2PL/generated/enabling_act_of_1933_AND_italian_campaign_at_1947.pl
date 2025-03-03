:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

italian_campaign(Start,End) :- begin('italian_campaign',_,_,Start), end('italian_campaign',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_AND_italian_campaign([]) :- assert(enabling_act_of_1933_AND_italian_campaign(-1,-1)).

generate_facts_enabling_act_of_1933_AND_italian_campaign([(Start,End) | Tail]) :- assert(enabling_act_of_1933_AND_italian_campaign(Start,End)), generate_facts_enabling_act_of_1933_AND_italian_campaign(Tail).

enabling_act_of_1933_AND_italian_campaign_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),italian_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_AND_italian_campaign(Interval).

enabling_act_of_1933_AND_italian_campaign_at_1947(Res) :- setof((Start,End),enabling_act_of_1933_AND_italian_campaign(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_AND_italian_campaign_at_1947'), (enabling_act_of_1933_AND_italian_campaign_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_AND_italian_campaign_aux().

