:- include('database.pl').
narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

steven_universe(Start,End) :- begin('steven_universe',_,_,Start), end('steven_universe',_,_,End), Start=<End.

generate_facts_narcos_AND_steven_universe([]) :- assert(narcos_AND_steven_universe(-1,-1)).

generate_facts_narcos_AND_steven_universe([(Start,End) | Tail]) :- assert(narcos_AND_steven_universe(Start,End)), generate_facts_narcos_AND_steven_universe(Tail).

narcos_AND_steven_universe_aux() :- findall((Start,End),narcos(Start,End),Interval1), findall((Start,End),steven_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_narcos_AND_steven_universe(Interval).

narcos_AND_steven_universe_at_1897(Res) :- setof((Start,End),narcos_AND_steven_universe(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = narcos_AND_steven_universe_at_1897'), (narcos_AND_steven_universe_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).
?- narcos_AND_steven_universe_aux().

