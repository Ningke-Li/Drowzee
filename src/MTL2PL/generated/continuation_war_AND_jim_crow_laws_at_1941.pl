:- include('database.pl').
continuation_war(Start,End) :- begin('continuation_war',_,_,Start), end('continuation_war',_,_,End), Start=<End.

jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

generate_facts_continuation_war_AND_jim_crow_laws([]) :- assert(continuation_war_AND_jim_crow_laws(-1,-1)).

generate_facts_continuation_war_AND_jim_crow_laws([(Start,End) | Tail]) :- assert(continuation_war_AND_jim_crow_laws(Start,End)), generate_facts_continuation_war_AND_jim_crow_laws(Tail).

continuation_war_AND_jim_crow_laws_aux() :- findall((Start,End),continuation_war(Start,End),Interval1), findall((Start,End),jim_crow_laws(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_continuation_war_AND_jim_crow_laws(Interval).

continuation_war_AND_jim_crow_laws_at_1941(Res) :- setof((Start,End),continuation_war_AND_jim_crow_laws(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = continuation_war_AND_jim_crow_laws_at_1941'), (continuation_war_AND_jim_crow_laws_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- continuation_war_AND_jim_crow_laws_aux().

