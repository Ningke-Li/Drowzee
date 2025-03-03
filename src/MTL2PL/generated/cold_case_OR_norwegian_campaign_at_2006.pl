:- include('database.pl').
cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

generate_facts_cold_case_OR_norwegian_campaign([]) :- assert(cold_case_OR_norwegian_campaign(-1,-1)).

generate_facts_cold_case_OR_norwegian_campaign([(Start,End) | Tail]) :- assert(cold_case_OR_norwegian_campaign(Start,End)), generate_facts_cold_case_OR_norwegian_campaign(Tail).

cold_case_OR_norwegian_campaign_aux() :- findall((Start,End),cold_case(Start,End),Interval1), findall((Start,End),norwegian_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cold_case_OR_norwegian_campaign(Interval).

cold_case_OR_norwegian_campaign_at_2006(Res) :- setof((Start,End),cold_case_OR_norwegian_campaign(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = cold_case_OR_norwegian_campaign_at_2006'), (cold_case_OR_norwegian_campaign_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cold_case_OR_norwegian_campaign_aux().

