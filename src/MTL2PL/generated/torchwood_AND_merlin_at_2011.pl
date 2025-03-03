:- include('database.pl').
torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

generate_facts_torchwood_AND_merlin([]) :- assert(torchwood_AND_merlin(-1,-1)).

generate_facts_torchwood_AND_merlin([(Start,End) | Tail]) :- assert(torchwood_AND_merlin(Start,End)), generate_facts_torchwood_AND_merlin(Tail).

torchwood_AND_merlin_aux() :- findall((Start,End),torchwood(Start,End),Interval1), findall((Start,End),merlin(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_torchwood_AND_merlin(Interval).

torchwood_AND_merlin_at_2011(Res) :- setof((Start,End),torchwood_AND_merlin(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = torchwood_AND_merlin_at_2011'), (torchwood_AND_merlin_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- torchwood_AND_merlin_aux().

