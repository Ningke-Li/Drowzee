:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

generate_facts_serbian_campaign_AND_three_hundred_and_thirty_five_years__war([]) :- assert(serbian_campaign_AND_three_hundred_and_thirty_five_years__war(-1,-1)).

generate_facts_serbian_campaign_AND_three_hundred_and_thirty_five_years__war([(Start,End) | Tail]) :- assert(serbian_campaign_AND_three_hundred_and_thirty_five_years__war(Start,End)), generate_facts_serbian_campaign_AND_three_hundred_and_thirty_five_years__war(Tail).

serbian_campaign_AND_three_hundred_and_thirty_five_years__war_aux() :- findall((Start,End),serbian_campaign(Start,End),Interval1), findall((Start,End),three_hundred_and_thirty_five_years__war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_serbian_campaign_AND_three_hundred_and_thirty_five_years__war(Interval).

serbian_campaign_AND_three_hundred_and_thirty_five_years__war_at_1892(Res) :- setof((Start,End),serbian_campaign_AND_three_hundred_and_thirty_five_years__war(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = serbian_campaign_AND_three_hundred_and_thirty_five_years__war_at_1892'), (serbian_campaign_AND_three_hundred_and_thirty_five_years__war_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).
?- serbian_campaign_AND_three_hundred_and_thirty_five_years__war_aux().

