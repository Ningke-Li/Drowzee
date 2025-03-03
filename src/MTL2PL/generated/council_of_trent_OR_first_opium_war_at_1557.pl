:- include('database.pl').
council_of_trent(Start,End) :- begin('council_of_trent',_,_,Start), end('council_of_trent',_,_,End), Start=<End.

first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

generate_facts_council_of_trent_OR_first_opium_war([]) :- assert(council_of_trent_OR_first_opium_war(-1,-1)).

generate_facts_council_of_trent_OR_first_opium_war([(Start,End) | Tail]) :- assert(council_of_trent_OR_first_opium_war(Start,End)), generate_facts_council_of_trent_OR_first_opium_war(Tail).

council_of_trent_OR_first_opium_war_aux() :- findall((Start,End),council_of_trent(Start,End),Interval1), findall((Start,End),first_opium_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_council_of_trent_OR_first_opium_war(Interval).

council_of_trent_OR_first_opium_war_at_1557(Res) :- setof((Start,End),council_of_trent_OR_first_opium_war(Start,End),AllINtervals), checkvalidity(1557,AllINtervals,Res).

check_query() :- write('Query = council_of_trent_OR_first_opium_war_at_1557'), (council_of_trent_OR_first_opium_war_at_1557(true) -> write('\nRes   = true');write('\nRes   = false')).
?- council_of_trent_OR_first_opium_war_aux().

