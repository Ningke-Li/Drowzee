:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

nip_tuck(Start,End) :- begin('nip_tuck',_,_,Start), end('nip_tuck',_,_,End), Start=<End.

generate_facts_the_walking_dead_OR_nip_tuck([]) :- assert(the_walking_dead_OR_nip_tuck(-1,-1)).

generate_facts_the_walking_dead_OR_nip_tuck([(Start,End) | Tail]) :- assert(the_walking_dead_OR_nip_tuck(Start,End)), generate_facts_the_walking_dead_OR_nip_tuck(Tail).

the_walking_dead_OR_nip_tuck_aux() :- findall((Start,End),the_walking_dead(Start,End),Interval1), findall((Start,End),nip_tuck(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_walking_dead_OR_nip_tuck(Interval).

the_walking_dead_OR_nip_tuck_at_2012(Res) :- setof((Start,End),the_walking_dead_OR_nip_tuck(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = the_walking_dead_OR_nip_tuck_at_2012'), (the_walking_dead_OR_nip_tuck_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_walking_dead_OR_nip_tuck_aux().

