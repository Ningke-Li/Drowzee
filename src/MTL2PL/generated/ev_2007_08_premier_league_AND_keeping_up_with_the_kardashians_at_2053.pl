:- include('database.pl').
ev_2007_08_premier_league(Start,End) :- begin('ev_2007_08_premier_league',_,_,Start), end('ev_2007_08_premier_league',_,_,End), Start=<End.

keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

generate_facts_ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians([]) :- assert(ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians(-1,-1)).

generate_facts_ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians([(Start,End) | Tail]) :- assert(ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians(Start,End)), generate_facts_ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians(Tail).

ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians_aux() :- findall((Start,End),ev_2007_08_premier_league(Start,End),Interval1), findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians(Interval).

ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians_at_2053(Res) :- setof((Start,End),ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians_at_2053'), (ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_premier_league_AND_keeping_up_with_the_kardashians_aux().

