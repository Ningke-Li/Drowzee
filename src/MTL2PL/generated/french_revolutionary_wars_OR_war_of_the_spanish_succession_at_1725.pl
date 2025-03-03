:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

generate_facts_french_revolutionary_wars_OR_war_of_the_spanish_succession([]) :- assert(french_revolutionary_wars_OR_war_of_the_spanish_succession(-1,-1)).

generate_facts_french_revolutionary_wars_OR_war_of_the_spanish_succession([(Start,End) | Tail]) :- assert(french_revolutionary_wars_OR_war_of_the_spanish_succession(Start,End)), generate_facts_french_revolutionary_wars_OR_war_of_the_spanish_succession(Tail).

french_revolutionary_wars_OR_war_of_the_spanish_succession_aux() :- findall((Start,End),french_revolutionary_wars(Start,End),Interval1), findall((Start,End),war_of_the_spanish_succession(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_french_revolutionary_wars_OR_war_of_the_spanish_succession(Interval).

french_revolutionary_wars_OR_war_of_the_spanish_succession_at_1725(Res) :- setof((Start,End),french_revolutionary_wars_OR_war_of_the_spanish_succession(Start,End),AllINtervals), checkvalidity(1725,AllINtervals,Res).

check_query() :- write('Query = french_revolutionary_wars_OR_war_of_the_spanish_succession_at_1725'), (french_revolutionary_wars_OR_war_of_the_spanish_succession_at_1725(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_revolutionary_wars_OR_war_of_the_spanish_succession_aux().

