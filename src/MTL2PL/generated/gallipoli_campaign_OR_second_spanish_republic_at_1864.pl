:- include('database.pl').
gallipoli_campaign(Start,End) :- begin('gallipoli_campaign',_,_,Start), end('gallipoli_campaign',_,_,End), Start=<End.

second_spanish_republic(Start,End) :- begin('second_spanish_republic',_,_,Start), end('second_spanish_republic',_,_,End), Start=<End.

generate_facts_gallipoli_campaign_OR_second_spanish_republic([]) :- assert(gallipoli_campaign_OR_second_spanish_republic(-1,-1)).

generate_facts_gallipoli_campaign_OR_second_spanish_republic([(Start,End) | Tail]) :- assert(gallipoli_campaign_OR_second_spanish_republic(Start,End)), generate_facts_gallipoli_campaign_OR_second_spanish_republic(Tail).

gallipoli_campaign_OR_second_spanish_republic_aux() :- findall((Start,End),gallipoli_campaign(Start,End),Interval1), findall((Start,End),second_spanish_republic(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_gallipoli_campaign_OR_second_spanish_republic(Interval).

gallipoli_campaign_OR_second_spanish_republic_at_1864(Res) :- setof((Start,End),gallipoli_campaign_OR_second_spanish_republic(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = gallipoli_campaign_OR_second_spanish_republic_at_1864'), (gallipoli_campaign_OR_second_spanish_republic_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gallipoli_campaign_OR_second_spanish_republic_aux().

