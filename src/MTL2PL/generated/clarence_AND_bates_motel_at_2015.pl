:- include('database.pl').
clarence(Start,End) :- begin('clarence',_,_,Start), end('clarence',_,_,End), Start=<End.

bates_motel(Start,End) :- begin('bates_motel',_,_,Start), end('bates_motel',_,_,End), Start=<End.

generate_facts_clarence_AND_bates_motel([]) :- assert(clarence_AND_bates_motel(-1,-1)).

generate_facts_clarence_AND_bates_motel([(Start,End) | Tail]) :- assert(clarence_AND_bates_motel(Start,End)), generate_facts_clarence_AND_bates_motel(Tail).

clarence_AND_bates_motel_aux() :- findall((Start,End),clarence(Start,End),Interval1), findall((Start,End),bates_motel(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_clarence_AND_bates_motel(Interval).

clarence_AND_bates_motel_at_2015(Res) :- setof((Start,End),clarence_AND_bates_motel(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = clarence_AND_bates_motel_at_2015'), (clarence_AND_bates_motel_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- clarence_AND_bates_motel_aux().

