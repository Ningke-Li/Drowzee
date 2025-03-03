:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_AND_austin___ally([]) :- assert(the_vampire_diaries_AND_austin___ally(-1,-1)).

generate_facts_the_vampire_diaries_AND_austin___ally([(Start,End) | Tail]) :- assert(the_vampire_diaries_AND_austin___ally(Start,End)), generate_facts_the_vampire_diaries_AND_austin___ally(Tail).

the_vampire_diaries_AND_austin___ally_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),austin___ally(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_AND_austin___ally(Interval).

the_vampire_diaries_AND_austin___ally_at_1870(Res) :- setof((Start,End),the_vampire_diaries_AND_austin___ally(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_AND_austin___ally_at_1870'), (the_vampire_diaries_AND_austin___ally_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_AND_austin___ally_aux().

