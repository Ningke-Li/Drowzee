:- include('database.pl').
blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

lie_to_me(Start,End) :- begin('lie_to_me',_,_,Start), end('lie_to_me',_,_,End), Start=<End.

generate_facts_blindspot_OR_lie_to_me([]) :- assert(blindspot_OR_lie_to_me(-1,-1)).

generate_facts_blindspot_OR_lie_to_me([(Start,End) | Tail]) :- assert(blindspot_OR_lie_to_me(Start,End)), generate_facts_blindspot_OR_lie_to_me(Tail).

blindspot_OR_lie_to_me_aux() :- findall((Start,End),blindspot(Start,End),Interval1), findall((Start,End),lie_to_me(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_blindspot_OR_lie_to_me(Interval).

blindspot_OR_lie_to_me_at_2017(Res) :- setof((Start,End),blindspot_OR_lie_to_me(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = blindspot_OR_lie_to_me_at_2017'), (blindspot_OR_lie_to_me_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- blindspot_OR_lie_to_me_aux().

