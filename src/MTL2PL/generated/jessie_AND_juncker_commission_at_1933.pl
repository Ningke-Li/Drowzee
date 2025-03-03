:- include('database.pl').
jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

generate_facts_jessie_AND_juncker_commission([]) :- assert(jessie_AND_juncker_commission(-1,-1)).

generate_facts_jessie_AND_juncker_commission([(Start,End) | Tail]) :- assert(jessie_AND_juncker_commission(Start,End)), generate_facts_jessie_AND_juncker_commission(Tail).

jessie_AND_juncker_commission_aux() :- findall((Start,End),jessie(Start,End),Interval1), findall((Start,End),juncker_commission(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jessie_AND_juncker_commission(Interval).

jessie_AND_juncker_commission_at_1933(Res) :- setof((Start,End),jessie_AND_juncker_commission(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = jessie_AND_juncker_commission_at_1933'), (jessie_AND_juncker_commission_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jessie_AND_juncker_commission_aux().

