:- include('database.pl').
turkish_war_of_independence(Start,End) :- begin('turkish_war_of_independence',_,_,Start), end('turkish_war_of_independence',_,_,End), Start=<End.

band_of_brothers(Start,End) :- begin('band_of_brothers',_,_,Start), end('band_of_brothers',_,_,End), Start=<End.

generate_facts_turkish_war_of_independence_OR_band_of_brothers([]) :- assert(turkish_war_of_independence_OR_band_of_brothers(-1,-1)).

generate_facts_turkish_war_of_independence_OR_band_of_brothers([(Start,End) | Tail]) :- assert(turkish_war_of_independence_OR_band_of_brothers(Start,End)), generate_facts_turkish_war_of_independence_OR_band_of_brothers(Tail).

turkish_war_of_independence_OR_band_of_brothers_aux() :- findall((Start,End),turkish_war_of_independence(Start,End),Interval1), findall((Start,End),band_of_brothers(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_turkish_war_of_independence_OR_band_of_brothers(Interval).

turkish_war_of_independence_OR_band_of_brothers_at_1943(Res) :- setof((Start,End),turkish_war_of_independence_OR_band_of_brothers(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = turkish_war_of_independence_OR_band_of_brothers_at_1943'), (turkish_war_of_independence_OR_band_of_brothers_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- turkish_war_of_independence_OR_band_of_brothers_aux().

