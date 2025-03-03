:- include('database.pl').
the_borgias(Start,End) :- begin('the_borgias',_,_,Start), end('the_borgias',_,_,End), Start=<End.

shake_it_up(Start,End) :- begin('shake_it_up',_,_,Start), end('shake_it_up',_,_,End), Start=<End.

generate_facts_the_borgias_AND_shake_it_up([]) :- assert(the_borgias_AND_shake_it_up(-1,-1)).

generate_facts_the_borgias_AND_shake_it_up([(Start,End) | Tail]) :- assert(the_borgias_AND_shake_it_up(Start,End)), generate_facts_the_borgias_AND_shake_it_up(Tail).

the_borgias_AND_shake_it_up_aux() :- findall((Start,End),the_borgias(Start,End),Interval1), findall((Start,End),shake_it_up(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_borgias_AND_shake_it_up(Interval).

the_borgias_AND_shake_it_up_at_1935(Res) :- setof((Start,End),the_borgias_AND_shake_it_up(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = the_borgias_AND_shake_it_up_at_1935'), (the_borgias_AND_shake_it_up_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_borgias_AND_shake_it_up_aux().

