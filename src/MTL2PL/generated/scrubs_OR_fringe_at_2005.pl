:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

fringe(Start,End) :- begin('fringe',_,_,Start), end('fringe',_,_,End), Start=<End.

generate_facts_scrubs_OR_fringe([]) :- assert(scrubs_OR_fringe(-1,-1)).

generate_facts_scrubs_OR_fringe([(Start,End) | Tail]) :- assert(scrubs_OR_fringe(Start,End)), generate_facts_scrubs_OR_fringe(Tail).

scrubs_OR_fringe_aux() :- findall((Start,End),scrubs(Start,End),Interval1), findall((Start,End),fringe(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_scrubs_OR_fringe(Interval).

scrubs_OR_fringe_at_2005(Res) :- setof((Start,End),scrubs_OR_fringe(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = scrubs_OR_fringe_at_2005'), (scrubs_OR_fringe_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scrubs_OR_fringe_aux().

