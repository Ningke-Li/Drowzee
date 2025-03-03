:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

american_civil_war(Start,End) :- begin('american_civil_war',_,_,Start), end('american_civil_war',_,_,End), Start=<End.

generate_facts_belgian_franc_AND_american_civil_war([]) :- assert(belgian_franc_AND_american_civil_war(-1,-1)).

generate_facts_belgian_franc_AND_american_civil_war([(Start,End) | Tail]) :- assert(belgian_franc_AND_american_civil_war(Start,End)), generate_facts_belgian_franc_AND_american_civil_war(Tail).

belgian_franc_AND_american_civil_war_aux() :- findall((Start,End),belgian_franc(Start,End),Interval1), findall((Start,End),american_civil_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_belgian_franc_AND_american_civil_war(Interval).

belgian_franc_AND_american_civil_war_at_1774(Res) :- setof((Start,End),belgian_franc_AND_american_civil_war(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_AND_american_civil_war_at_1774'), (belgian_franc_AND_american_civil_war_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).
?- belgian_franc_AND_american_civil_war_aux().

