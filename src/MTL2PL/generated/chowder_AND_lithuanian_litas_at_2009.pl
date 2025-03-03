:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

generate_facts_chowder_AND_lithuanian_litas([]) :- assert(chowder_AND_lithuanian_litas(-1,-1)).

generate_facts_chowder_AND_lithuanian_litas([(Start,End) | Tail]) :- assert(chowder_AND_lithuanian_litas(Start,End)), generate_facts_chowder_AND_lithuanian_litas(Tail).

chowder_AND_lithuanian_litas_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),lithuanian_litas(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_chowder_AND_lithuanian_litas(Interval).

chowder_AND_lithuanian_litas_at_2009(Res) :- setof((Start,End),chowder_AND_lithuanian_litas(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = chowder_AND_lithuanian_litas_at_2009'), (chowder_AND_lithuanian_litas_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_AND_lithuanian_litas_aux().

