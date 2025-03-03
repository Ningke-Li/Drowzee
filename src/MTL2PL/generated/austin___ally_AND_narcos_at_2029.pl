:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

generate_facts_austin___ally_AND_narcos([]) :- assert(austin___ally_AND_narcos(-1,-1)).

generate_facts_austin___ally_AND_narcos([(Start,End) | Tail]) :- assert(austin___ally_AND_narcos(Start,End)), generate_facts_austin___ally_AND_narcos(Tail).

austin___ally_AND_narcos_aux() :- findall((Start,End),austin___ally(Start,End),Interval1), findall((Start,End),narcos(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_austin___ally_AND_narcos(Interval).

austin___ally_AND_narcos_at_2029(Res) :- setof((Start,End),austin___ally_AND_narcos(Start,End),AllINtervals), checkvalidity(2029,AllINtervals,Res).

check_query() :- write('Query = austin___ally_AND_narcos_at_2029'), (austin___ally_AND_narcos_at_2029(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austin___ally_AND_narcos_aux().

