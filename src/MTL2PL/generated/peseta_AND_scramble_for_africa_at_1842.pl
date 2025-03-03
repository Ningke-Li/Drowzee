:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

generate_facts_peseta_AND_scramble_for_africa([]) :- assert(peseta_AND_scramble_for_africa(-1,-1)).

generate_facts_peseta_AND_scramble_for_africa([(Start,End) | Tail]) :- assert(peseta_AND_scramble_for_africa(Start,End)), generate_facts_peseta_AND_scramble_for_africa(Tail).

peseta_AND_scramble_for_africa_aux() :- findall((Start,End),peseta(Start,End),Interval1), findall((Start,End),scramble_for_africa(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peseta_AND_scramble_for_africa(Interval).

peseta_AND_scramble_for_africa_at_1842(Res) :- setof((Start,End),peseta_AND_scramble_for_africa(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = peseta_AND_scramble_for_africa_at_1842'), (peseta_AND_scramble_for_africa_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peseta_AND_scramble_for_africa_aux().

