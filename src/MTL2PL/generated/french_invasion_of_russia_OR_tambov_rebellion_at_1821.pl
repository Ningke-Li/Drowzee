:- include('database.pl').
french_invasion_of_russia(Start,End) :- begin('french_invasion_of_russia',_,_,Start), end('french_invasion_of_russia',_,_,End), Start=<End.

tambov_rebellion(Start,End) :- begin('tambov_rebellion',_,_,Start), end('tambov_rebellion',_,_,End), Start=<End.

generate_facts_french_invasion_of_russia_OR_tambov_rebellion([]) :- assert(french_invasion_of_russia_OR_tambov_rebellion(-1,-1)).

generate_facts_french_invasion_of_russia_OR_tambov_rebellion([(Start,End) | Tail]) :- assert(french_invasion_of_russia_OR_tambov_rebellion(Start,End)), generate_facts_french_invasion_of_russia_OR_tambov_rebellion(Tail).

french_invasion_of_russia_OR_tambov_rebellion_aux() :- findall((Start,End),french_invasion_of_russia(Start,End),Interval1), findall((Start,End),tambov_rebellion(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_french_invasion_of_russia_OR_tambov_rebellion(Interval).

french_invasion_of_russia_OR_tambov_rebellion_at_1821(Res) :- setof((Start,End),french_invasion_of_russia_OR_tambov_rebellion(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = french_invasion_of_russia_OR_tambov_rebellion_at_1821'), (french_invasion_of_russia_OR_tambov_rebellion_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_invasion_of_russia_OR_tambov_rebellion_aux().

