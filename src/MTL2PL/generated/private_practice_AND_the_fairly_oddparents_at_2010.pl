:- include('database.pl').
private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

generate_facts_private_practice_AND_the_fairly_oddparents([]) :- assert(private_practice_AND_the_fairly_oddparents(-1,-1)).

generate_facts_private_practice_AND_the_fairly_oddparents([(Start,End) | Tail]) :- assert(private_practice_AND_the_fairly_oddparents(Start,End)), generate_facts_private_practice_AND_the_fairly_oddparents(Tail).

private_practice_AND_the_fairly_oddparents_aux() :- findall((Start,End),private_practice(Start,End),Interval1), findall((Start,End),the_fairly_oddparents(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_private_practice_AND_the_fairly_oddparents(Interval).

private_practice_AND_the_fairly_oddparents_at_2010(Res) :- setof((Start,End),private_practice_AND_the_fairly_oddparents(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = private_practice_AND_the_fairly_oddparents_at_2010'), (private_practice_AND_the_fairly_oddparents_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- private_practice_AND_the_fairly_oddparents_aux().

