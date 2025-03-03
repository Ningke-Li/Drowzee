:- include('database.pl').
cyclone_nargis(Start,End) :- begin('cyclone_nargis',_,_,Start), end('cyclone_nargis',_,_,End), Start=<End.

northern_seven_years__war(Start,End) :- begin('northern_seven_years__war',_,_,Start), end('northern_seven_years__war',_,_,End), Start=<End.

generate_facts_cyclone_nargis_OR_northern_seven_years__war([]) :- assert(cyclone_nargis_OR_northern_seven_years__war(-1,-1)).

generate_facts_cyclone_nargis_OR_northern_seven_years__war([(Start,End) | Tail]) :- assert(cyclone_nargis_OR_northern_seven_years__war(Start,End)), generate_facts_cyclone_nargis_OR_northern_seven_years__war(Tail).

cyclone_nargis_OR_northern_seven_years__war_aux() :- findall((Start,End),cyclone_nargis(Start,End),Interval1), findall((Start,End),northern_seven_years__war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cyclone_nargis_OR_northern_seven_years__war(Interval).

cyclone_nargis_OR_northern_seven_years__war_at_1563(Res) :- setof((Start,End),cyclone_nargis_OR_northern_seven_years__war(Start,End),AllINtervals), checkvalidity(1563,AllINtervals,Res).

check_query() :- write('Query = cyclone_nargis_OR_northern_seven_years__war_at_1563'), (cyclone_nargis_OR_northern_seven_years__war_at_1563(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cyclone_nargis_OR_northern_seven_years__war_aux().

