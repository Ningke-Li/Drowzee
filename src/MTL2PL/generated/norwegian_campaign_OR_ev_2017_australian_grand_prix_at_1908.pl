:- include('database.pl').
norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

ev_2017_australian_grand_prix(Start,End) :- begin('ev_2017_australian_grand_prix',_,_,Start), end('ev_2017_australian_grand_prix',_,_,End), Start=<End.

generate_facts_norwegian_campaign_OR_ev_2017_australian_grand_prix([]) :- assert(norwegian_campaign_OR_ev_2017_australian_grand_prix(-1,-1)).

generate_facts_norwegian_campaign_OR_ev_2017_australian_grand_prix([(Start,End) | Tail]) :- assert(norwegian_campaign_OR_ev_2017_australian_grand_prix(Start,End)), generate_facts_norwegian_campaign_OR_ev_2017_australian_grand_prix(Tail).

norwegian_campaign_OR_ev_2017_australian_grand_prix_aux() :- findall((Start,End),norwegian_campaign(Start,End),Interval1), findall((Start,End),ev_2017_australian_grand_prix(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_norwegian_campaign_OR_ev_2017_australian_grand_prix(Interval).

norwegian_campaign_OR_ev_2017_australian_grand_prix_at_1908(Res) :- setof((Start,End),norwegian_campaign_OR_ev_2017_australian_grand_prix(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = norwegian_campaign_OR_ev_2017_australian_grand_prix_at_1908'), (norwegian_campaign_OR_ev_2017_australian_grand_prix_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- norwegian_campaign_OR_ev_2017_australian_grand_prix_aux().

