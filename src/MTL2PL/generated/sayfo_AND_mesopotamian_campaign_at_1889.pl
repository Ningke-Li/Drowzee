:- include('database.pl').
sayfo(Start,End) :- begin('sayfo',_,_,Start), end('sayfo',_,_,End), Start=<End.

mesopotamian_campaign(Start,End) :- begin('mesopotamian_campaign',_,_,Start), end('mesopotamian_campaign',_,_,End), Start=<End.

generate_facts_sayfo_AND_mesopotamian_campaign([]) :- assert(sayfo_AND_mesopotamian_campaign(-1,-1)).

generate_facts_sayfo_AND_mesopotamian_campaign([(Start,End) | Tail]) :- assert(sayfo_AND_mesopotamian_campaign(Start,End)), generate_facts_sayfo_AND_mesopotamian_campaign(Tail).

sayfo_AND_mesopotamian_campaign_aux() :- findall((Start,End),sayfo(Start,End),Interval1), findall((Start,End),mesopotamian_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sayfo_AND_mesopotamian_campaign(Interval).

sayfo_AND_mesopotamian_campaign_at_1889(Res) :- setof((Start,End),sayfo_AND_mesopotamian_campaign(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = sayfo_AND_mesopotamian_campaign_at_1889'), (sayfo_AND_mesopotamian_campaign_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sayfo_AND_mesopotamian_campaign_aux().

