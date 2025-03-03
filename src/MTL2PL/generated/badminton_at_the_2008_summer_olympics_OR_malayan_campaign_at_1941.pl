:- include('database.pl').
badminton_at_the_2008_summer_olympics(Start,End) :- begin('badminton_at_the_2008_summer_olympics',_,_,Start), end('badminton_at_the_2008_summer_olympics',_,_,End), Start=<End.

malayan_campaign(Start,End) :- begin('malayan_campaign',_,_,Start), end('malayan_campaign',_,_,End), Start=<End.

generate_facts_badminton_at_the_2008_summer_olympics_OR_malayan_campaign([]) :- assert(badminton_at_the_2008_summer_olympics_OR_malayan_campaign(-1,-1)).

generate_facts_badminton_at_the_2008_summer_olympics_OR_malayan_campaign([(Start,End) | Tail]) :- assert(badminton_at_the_2008_summer_olympics_OR_malayan_campaign(Start,End)), generate_facts_badminton_at_the_2008_summer_olympics_OR_malayan_campaign(Tail).

badminton_at_the_2008_summer_olympics_OR_malayan_campaign_aux() :- findall((Start,End),badminton_at_the_2008_summer_olympics(Start,End),Interval1), findall((Start,End),malayan_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_badminton_at_the_2008_summer_olympics_OR_malayan_campaign(Interval).

badminton_at_the_2008_summer_olympics_OR_malayan_campaign_at_1941(Res) :- setof((Start,End),badminton_at_the_2008_summer_olympics_OR_malayan_campaign(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = badminton_at_the_2008_summer_olympics_OR_malayan_campaign_at_1941'), (badminton_at_the_2008_summer_olympics_OR_malayan_campaign_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- badminton_at_the_2008_summer_olympics_OR_malayan_campaign_aux().

