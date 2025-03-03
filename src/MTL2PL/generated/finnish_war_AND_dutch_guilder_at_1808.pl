:- include('database.pl').
finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

generate_facts_finnish_war_AND_dutch_guilder([]) :- assert(finnish_war_AND_dutch_guilder(-1,-1)).

generate_facts_finnish_war_AND_dutch_guilder([(Start,End) | Tail]) :- assert(finnish_war_AND_dutch_guilder(Start,End)), generate_facts_finnish_war_AND_dutch_guilder(Tail).

finnish_war_AND_dutch_guilder_aux() :- findall((Start,End),finnish_war(Start,End),Interval1), findall((Start,End),dutch_guilder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_finnish_war_AND_dutch_guilder(Interval).

finnish_war_AND_dutch_guilder_at_1808(Res) :- setof((Start,End),finnish_war_AND_dutch_guilder(Start,End),AllINtervals), checkvalidity(1808,AllINtervals,Res).

check_query() :- write('Query = finnish_war_AND_dutch_guilder_at_1808'), (finnish_war_AND_dutch_guilder_at_1808(true) -> write('\nRes   = true');write('\nRes   = false')).
?- finnish_war_AND_dutch_guilder_aux().

