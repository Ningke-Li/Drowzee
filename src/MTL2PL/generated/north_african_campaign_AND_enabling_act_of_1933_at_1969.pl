:- include('database.pl').
north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

generate_facts_north_african_campaign_AND_enabling_act_of_1933([]) :- assert(north_african_campaign_AND_enabling_act_of_1933(-1,-1)).

generate_facts_north_african_campaign_AND_enabling_act_of_1933([(Start,End) | Tail]) :- assert(north_african_campaign_AND_enabling_act_of_1933(Start,End)), generate_facts_north_african_campaign_AND_enabling_act_of_1933(Tail).

north_african_campaign_AND_enabling_act_of_1933_aux() :- findall((Start,End),north_african_campaign(Start,End),Interval1), findall((Start,End),enabling_act_of_1933(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_north_african_campaign_AND_enabling_act_of_1933(Interval).

north_african_campaign_AND_enabling_act_of_1933_at_1969(Res) :- setof((Start,End),north_african_campaign_AND_enabling_act_of_1933(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = north_african_campaign_AND_enabling_act_of_1933_at_1969'), (north_african_campaign_AND_enabling_act_of_1933_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- north_african_campaign_AND_enabling_act_of_1933_aux().

