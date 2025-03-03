:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

generate_facts_serbian_campaign_AND_province_of_finland([]) :- assert(serbian_campaign_AND_province_of_finland(-1,-1)).

generate_facts_serbian_campaign_AND_province_of_finland([(Start,End) | Tail]) :- assert(serbian_campaign_AND_province_of_finland(Start,End)), generate_facts_serbian_campaign_AND_province_of_finland(Tail).

serbian_campaign_AND_province_of_finland_aux() :- findall((Start,End),serbian_campaign(Start,End),Interval1), findall((Start,End),province_of_finland(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_serbian_campaign_AND_province_of_finland(Interval).

serbian_campaign_AND_province_of_finland_at_1914(Res) :- setof((Start,End),serbian_campaign_AND_province_of_finland(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = serbian_campaign_AND_province_of_finland_at_1914'), (serbian_campaign_AND_province_of_finland_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- serbian_campaign_AND_province_of_finland_aux().

