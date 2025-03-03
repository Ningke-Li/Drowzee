:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_OR_eastern_front([]) :- assert(the_vampire_diaries_OR_eastern_front(-1,-1)).

generate_facts_the_vampire_diaries_OR_eastern_front([(Start,End) | Tail]) :- assert(the_vampire_diaries_OR_eastern_front(Start,End)), generate_facts_the_vampire_diaries_OR_eastern_front(Tail).

the_vampire_diaries_OR_eastern_front_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),eastern_front(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_OR_eastern_front(Interval).

the_vampire_diaries_OR_eastern_front_at_2013(Res) :- setof((Start,End),the_vampire_diaries_OR_eastern_front(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_OR_eastern_front_at_2013'), (the_vampire_diaries_OR_eastern_front_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_OR_eastern_front_aux().

