:- include('database.pl').
french_revolutionary_wars(Start,End) :- begin('french_revolutionary_wars',_,_,Start), end('french_revolutionary_wars',_,_,End), Start=<End.

cavendish_experiment(Start,End) :- begin('cavendish_experiment',_,_,Start), end('cavendish_experiment',_,_,End), Start=<End.

generate_facts_french_revolutionary_wars_AND_cavendish_experiment([]) :- assert(french_revolutionary_wars_AND_cavendish_experiment(-1,-1)).

generate_facts_french_revolutionary_wars_AND_cavendish_experiment([(Start,End) | Tail]) :- assert(french_revolutionary_wars_AND_cavendish_experiment(Start,End)), generate_facts_french_revolutionary_wars_AND_cavendish_experiment(Tail).

french_revolutionary_wars_AND_cavendish_experiment_aux() :- findall((Start,End),french_revolutionary_wars(Start,End),Interval1), findall((Start,End),cavendish_experiment(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_french_revolutionary_wars_AND_cavendish_experiment(Interval).

french_revolutionary_wars_AND_cavendish_experiment_at_1751(Res) :- setof((Start,End),french_revolutionary_wars_AND_cavendish_experiment(Start,End),AllINtervals), checkvalidity(1751,AllINtervals,Res).

check_query() :- write('Query = french_revolutionary_wars_AND_cavendish_experiment_at_1751'), (french_revolutionary_wars_AND_cavendish_experiment_at_1751(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_revolutionary_wars_AND_cavendish_experiment_aux().

