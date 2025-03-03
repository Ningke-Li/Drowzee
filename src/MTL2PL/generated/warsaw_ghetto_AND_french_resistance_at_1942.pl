:- include('database.pl').
warsaw_ghetto(Start,End) :- begin('warsaw_ghetto',_,_,Start), end('warsaw_ghetto',_,_,End), Start=<End.

french_resistance(Start,End) :- begin('french_resistance',_,_,Start), end('french_resistance',_,_,End), Start=<End.

generate_facts_warsaw_ghetto_AND_french_resistance([]) :- assert(warsaw_ghetto_AND_french_resistance(-1,-1)).

generate_facts_warsaw_ghetto_AND_french_resistance([(Start,End) | Tail]) :- assert(warsaw_ghetto_AND_french_resistance(Start,End)), generate_facts_warsaw_ghetto_AND_french_resistance(Tail).

warsaw_ghetto_AND_french_resistance_aux() :- findall((Start,End),warsaw_ghetto(Start,End),Interval1), findall((Start,End),french_resistance(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_warsaw_ghetto_AND_french_resistance(Interval).

warsaw_ghetto_AND_french_resistance_at_1942(Res) :- setof((Start,End),warsaw_ghetto_AND_french_resistance(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = warsaw_ghetto_AND_french_resistance_at_1942'), (warsaw_ghetto_AND_french_resistance_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- warsaw_ghetto_AND_french_resistance_aux().

