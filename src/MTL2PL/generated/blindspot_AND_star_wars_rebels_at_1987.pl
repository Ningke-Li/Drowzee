:- include('database.pl').
blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

generate_facts_blindspot_AND_star_wars_rebels([]) :- assert(blindspot_AND_star_wars_rebels(-1,-1)).

generate_facts_blindspot_AND_star_wars_rebels([(Start,End) | Tail]) :- assert(blindspot_AND_star_wars_rebels(Start,End)), generate_facts_blindspot_AND_star_wars_rebels(Tail).

blindspot_AND_star_wars_rebels_aux() :- findall((Start,End),blindspot(Start,End),Interval1), findall((Start,End),star_wars_rebels(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_blindspot_AND_star_wars_rebels(Interval).

blindspot_AND_star_wars_rebels_at_1987(Res) :- setof((Start,End),blindspot_AND_star_wars_rebels(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = blindspot_AND_star_wars_rebels_at_1987'), (blindspot_AND_star_wars_rebels_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).
?- blindspot_AND_star_wars_rebels_aux().

