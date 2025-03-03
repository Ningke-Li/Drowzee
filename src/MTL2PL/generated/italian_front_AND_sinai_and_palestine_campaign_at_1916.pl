:- include('database.pl').
italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

sinai_and_palestine_campaign(Start,End) :- begin('sinai_and_palestine_campaign',_,_,Start), end('sinai_and_palestine_campaign',_,_,End), Start=<End.

generate_facts_italian_front_AND_sinai_and_palestine_campaign([]) :- assert(italian_front_AND_sinai_and_palestine_campaign(-1,-1)).

generate_facts_italian_front_AND_sinai_and_palestine_campaign([(Start,End) | Tail]) :- assert(italian_front_AND_sinai_and_palestine_campaign(Start,End)), generate_facts_italian_front_AND_sinai_and_palestine_campaign(Tail).

italian_front_AND_sinai_and_palestine_campaign_aux() :- findall((Start,End),italian_front(Start,End),Interval1), findall((Start,End),sinai_and_palestine_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_italian_front_AND_sinai_and_palestine_campaign(Interval).

italian_front_AND_sinai_and_palestine_campaign_at_1916(Res) :- setof((Start,End),italian_front_AND_sinai_and_palestine_campaign(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = italian_front_AND_sinai_and_palestine_campaign_at_1916'), (italian_front_AND_sinai_and_palestine_campaign_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_front_AND_sinai_and_palestine_campaign_aux().

