:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

generate_facts_dutch_guilder_AND_second_boer_war([]) :- assert(dutch_guilder_AND_second_boer_war(-1,-1)).

generate_facts_dutch_guilder_AND_second_boer_war([(Start,End) | Tail]) :- assert(dutch_guilder_AND_second_boer_war(Start,End)), generate_facts_dutch_guilder_AND_second_boer_war(Tail).

dutch_guilder_AND_second_boer_war_aux() :- findall((Start,End),dutch_guilder(Start,End),Interval1), findall((Start,End),second_boer_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dutch_guilder_AND_second_boer_war(Interval).

dutch_guilder_AND_second_boer_war_at_1900(Res) :- setof((Start,End),dutch_guilder_AND_second_boer_war(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_AND_second_boer_war_at_1900'), (dutch_guilder_AND_second_boer_war_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dutch_guilder_AND_second_boer_war_aux().

