:- include('database.pl').
german_mark(Start,End) :- begin('german_mark',_,_,Start), end('german_mark',_,_,End), Start=<End.

philippine_american_war(Start,End) :- begin('philippine_american_war',_,_,Start), end('philippine_american_war',_,_,End), Start=<End.

generate_facts_german_mark_AND_philippine_american_war([]) :- assert(german_mark_AND_philippine_american_war(-1,-1)).

generate_facts_german_mark_AND_philippine_american_war([(Start,End) | Tail]) :- assert(german_mark_AND_philippine_american_war(Start,End)), generate_facts_german_mark_AND_philippine_american_war(Tail).

german_mark_AND_philippine_american_war_aux() :- findall((Start,End),german_mark(Start,End),Interval1), findall((Start,End),philippine_american_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_german_mark_AND_philippine_american_war(Interval).

german_mark_AND_philippine_american_war_at_1899(Res) :- setof((Start,End),german_mark_AND_philippine_american_war(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = german_mark_AND_philippine_american_war_at_1899'), (german_mark_AND_philippine_american_war_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).
?- german_mark_AND_philippine_american_war_aux().

