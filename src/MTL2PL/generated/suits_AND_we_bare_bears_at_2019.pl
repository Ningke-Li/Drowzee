:- include('database.pl').
suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

generate_facts_suits_AND_we_bare_bears([]) :- assert(suits_AND_we_bare_bears(-1,-1)).

generate_facts_suits_AND_we_bare_bears([(Start,End) | Tail]) :- assert(suits_AND_we_bare_bears(Start,End)), generate_facts_suits_AND_we_bare_bears(Tail).

suits_AND_we_bare_bears_aux() :- findall((Start,End),suits(Start,End),Interval1), findall((Start,End),we_bare_bears(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_suits_AND_we_bare_bears(Interval).

suits_AND_we_bare_bears_at_2019(Res) :- setof((Start,End),suits_AND_we_bare_bears(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = suits_AND_we_bare_bears_at_2019'), (suits_AND_we_bare_bears_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- suits_AND_we_bare_bears_aux().

