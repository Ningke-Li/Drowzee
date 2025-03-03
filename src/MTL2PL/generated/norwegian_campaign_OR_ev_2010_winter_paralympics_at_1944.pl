:- include('database.pl').
norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

ev_2010_winter_paralympics(Start,End) :- begin('ev_2010_winter_paralympics',_,_,Start), end('ev_2010_winter_paralympics',_,_,End), Start=<End.

generate_facts_norwegian_campaign_OR_ev_2010_winter_paralympics([]) :- assert(norwegian_campaign_OR_ev_2010_winter_paralympics(-1,-1)).

generate_facts_norwegian_campaign_OR_ev_2010_winter_paralympics([(Start,End) | Tail]) :- assert(norwegian_campaign_OR_ev_2010_winter_paralympics(Start,End)), generate_facts_norwegian_campaign_OR_ev_2010_winter_paralympics(Tail).

norwegian_campaign_OR_ev_2010_winter_paralympics_aux() :- findall((Start,End),norwegian_campaign(Start,End),Interval1), findall((Start,End),ev_2010_winter_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_norwegian_campaign_OR_ev_2010_winter_paralympics(Interval).

norwegian_campaign_OR_ev_2010_winter_paralympics_at_1944(Res) :- setof((Start,End),norwegian_campaign_OR_ev_2010_winter_paralympics(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = norwegian_campaign_OR_ev_2010_winter_paralympics_at_1944'), (norwegian_campaign_OR_ev_2010_winter_paralympics_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- norwegian_campaign_OR_ev_2010_winter_paralympics_aux().

