:- include('database.pl').
little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

generate_facts_little_britain_AND_danny_phantom([]) :- assert(little_britain_AND_danny_phantom(-1,-1)).

generate_facts_little_britain_AND_danny_phantom([(Start,End) | Tail]) :- assert(little_britain_AND_danny_phantom(Start,End)), generate_facts_little_britain_AND_danny_phantom(Tail).

little_britain_AND_danny_phantom_aux() :- findall((Start,End),little_britain(Start,End),Interval1), findall((Start,End),danny_phantom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_little_britain_AND_danny_phantom(Interval).

little_britain_AND_danny_phantom_at_1938(Res) :- setof((Start,End),little_britain_AND_danny_phantom(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = little_britain_AND_danny_phantom_at_1938'), (little_britain_AND_danny_phantom_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).
?- little_britain_AND_danny_phantom_aux().

