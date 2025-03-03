:- include('database.pl').
once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

falaise_pocket(Start,End) :- begin('falaise_pocket',_,_,Start), end('falaise_pocket',_,_,End), Start=<End.

generate_facts_once_upon_a_time_OR_falaise_pocket([]) :- assert(once_upon_a_time_OR_falaise_pocket(-1,-1)).

generate_facts_once_upon_a_time_OR_falaise_pocket([(Start,End) | Tail]) :- assert(once_upon_a_time_OR_falaise_pocket(Start,End)), generate_facts_once_upon_a_time_OR_falaise_pocket(Tail).

once_upon_a_time_OR_falaise_pocket_aux() :- findall((Start,End),once_upon_a_time(Start,End),Interval1), findall((Start,End),falaise_pocket(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_once_upon_a_time_OR_falaise_pocket(Interval).

once_upon_a_time_OR_falaise_pocket_at_2014(Res) :- setof((Start,End),once_upon_a_time_OR_falaise_pocket(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = once_upon_a_time_OR_falaise_pocket_at_2014'), (once_upon_a_time_OR_falaise_pocket_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- once_upon_a_time_OR_falaise_pocket_aux().

