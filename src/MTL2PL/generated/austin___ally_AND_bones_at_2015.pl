:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

generate_facts_austin___ally_AND_bones([]) :- assert(austin___ally_AND_bones(-1,-1)).

generate_facts_austin___ally_AND_bones([(Start,End) | Tail]) :- assert(austin___ally_AND_bones(Start,End)), generate_facts_austin___ally_AND_bones(Tail).

austin___ally_AND_bones_aux() :- findall((Start,End),austin___ally(Start,End),Interval1), findall((Start,End),bones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_austin___ally_AND_bones(Interval).

austin___ally_AND_bones_at_2015(Res) :- setof((Start,End),austin___ally_AND_bones(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = austin___ally_AND_bones_at_2015'), (austin___ally_AND_bones_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austin___ally_AND_bones_aux().

