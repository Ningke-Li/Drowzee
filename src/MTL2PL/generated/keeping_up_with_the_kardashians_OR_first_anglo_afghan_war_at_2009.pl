:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

generate_facts_keeping_up_with_the_kardashians_OR_first_anglo_afghan_war([]) :- assert(keeping_up_with_the_kardashians_OR_first_anglo_afghan_war(-1,-1)).

generate_facts_keeping_up_with_the_kardashians_OR_first_anglo_afghan_war([(Start,End) | Tail]) :- assert(keeping_up_with_the_kardashians_OR_first_anglo_afghan_war(Start,End)), generate_facts_keeping_up_with_the_kardashians_OR_first_anglo_afghan_war(Tail).

keeping_up_with_the_kardashians_OR_first_anglo_afghan_war_aux() :- findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval1), findall((Start,End),first_anglo_afghan_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_keeping_up_with_the_kardashians_OR_first_anglo_afghan_war(Interval).

keeping_up_with_the_kardashians_OR_first_anglo_afghan_war_at_2009(Res) :- setof((Start,End),keeping_up_with_the_kardashians_OR_first_anglo_afghan_war(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = keeping_up_with_the_kardashians_OR_first_anglo_afghan_war_at_2009'), (keeping_up_with_the_kardashians_OR_first_anglo_afghan_war_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- keeping_up_with_the_kardashians_OR_first_anglo_afghan_war_aux().

