:- include('database.pl').
spanish_golden_age(Start,End) :- begin('spanish_golden_age',_,_,Start), end('spanish_golden_age',_,_,End), Start=<End.

polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

generate_facts_spanish_golden_age_AND_polish_muscovite_war([]) :- assert(spanish_golden_age_AND_polish_muscovite_war(-1,-1)).

generate_facts_spanish_golden_age_AND_polish_muscovite_war([(Start,End) | Tail]) :- assert(spanish_golden_age_AND_polish_muscovite_war(Start,End)), generate_facts_spanish_golden_age_AND_polish_muscovite_war(Tail).

spanish_golden_age_AND_polish_muscovite_war_aux() :- findall((Start,End),spanish_golden_age(Start,End),Interval1), findall((Start,End),polish_muscovite_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_spanish_golden_age_AND_polish_muscovite_war(Interval).

spanish_golden_age_AND_polish_muscovite_war_at_1614(Res) :- setof((Start,End),spanish_golden_age_AND_polish_muscovite_war(Start,End),AllINtervals), checkvalidity(1614,AllINtervals,Res).

check_query() :- write('Query = spanish_golden_age_AND_polish_muscovite_war_at_1614'), (spanish_golden_age_AND_polish_muscovite_war_at_1614(true) -> write('\nRes   = true');write('\nRes   = false')).
?- spanish_golden_age_AND_polish_muscovite_war_aux().

