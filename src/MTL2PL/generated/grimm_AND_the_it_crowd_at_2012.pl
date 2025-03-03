:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

generate_facts_grimm_AND_the_it_crowd([]) :- assert(grimm_AND_the_it_crowd(-1,-1)).

generate_facts_grimm_AND_the_it_crowd([(Start,End) | Tail]) :- assert(grimm_AND_the_it_crowd(Start,End)), generate_facts_grimm_AND_the_it_crowd(Tail).

grimm_AND_the_it_crowd_aux() :- findall((Start,End),grimm(Start,End),Interval1), findall((Start,End),the_it_crowd(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_grimm_AND_the_it_crowd(Interval).

grimm_AND_the_it_crowd_at_2012(Res) :- setof((Start,End),grimm_AND_the_it_crowd(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = grimm_AND_the_it_crowd_at_2012'), (grimm_AND_the_it_crowd_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- grimm_AND_the_it_crowd_aux().

