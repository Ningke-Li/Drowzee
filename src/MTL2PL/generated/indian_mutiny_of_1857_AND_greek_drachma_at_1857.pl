:- include('database.pl').
indian_mutiny_of_1857(Start,End) :- begin('indian_mutiny_of_1857',_,_,Start), end('indian_mutiny_of_1857',_,_,End), Start=<End.

greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

generate_facts_indian_mutiny_of_1857_AND_greek_drachma([]) :- assert(indian_mutiny_of_1857_AND_greek_drachma(-1,-1)).

generate_facts_indian_mutiny_of_1857_AND_greek_drachma([(Start,End) | Tail]) :- assert(indian_mutiny_of_1857_AND_greek_drachma(Start,End)), generate_facts_indian_mutiny_of_1857_AND_greek_drachma(Tail).

indian_mutiny_of_1857_AND_greek_drachma_aux() :- findall((Start,End),indian_mutiny_of_1857(Start,End),Interval1), findall((Start,End),greek_drachma(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_indian_mutiny_of_1857_AND_greek_drachma(Interval).

indian_mutiny_of_1857_AND_greek_drachma_at_1857(Res) :- setof((Start,End),indian_mutiny_of_1857_AND_greek_drachma(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = indian_mutiny_of_1857_AND_greek_drachma_at_1857'), (indian_mutiny_of_1857_AND_greek_drachma_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).
?- indian_mutiny_of_1857_AND_greek_drachma_aux().

