:- include('database.pl').
star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

generate_facts_star_trek__enterprise_AND_scrubs([]) :- assert(star_trek__enterprise_AND_scrubs(-1,-1)).

generate_facts_star_trek__enterprise_AND_scrubs([(Start,End) | Tail]) :- assert(star_trek__enterprise_AND_scrubs(Start,End)), generate_facts_star_trek__enterprise_AND_scrubs(Tail).

star_trek__enterprise_AND_scrubs_aux() :- findall((Start,End),star_trek__enterprise(Start,End),Interval1), findall((Start,End),scrubs(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_star_trek__enterprise_AND_scrubs(Interval).

star_trek__enterprise_AND_scrubs_at_2012(Res) :- setof((Start,End),star_trek__enterprise_AND_scrubs(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = star_trek__enterprise_AND_scrubs_at_2012'), (star_trek__enterprise_AND_scrubs_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_trek__enterprise_AND_scrubs_aux().

