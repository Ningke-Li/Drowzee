:- include('database.pl').
cavendish_experiment(Start,End) :- begin('cavendish_experiment',_,_,Start), end('cavendish_experiment',_,_,End), Start=<End.

hurricane_irma(Start,End) :- begin('hurricane_irma',_,_,Start), end('hurricane_irma',_,_,End), Start=<End.

generate_facts_cavendish_experiment_OR_hurricane_irma([]) :- assert(cavendish_experiment_OR_hurricane_irma(-1,-1)).

generate_facts_cavendish_experiment_OR_hurricane_irma([(Start,End) | Tail]) :- assert(cavendish_experiment_OR_hurricane_irma(Start,End)), generate_facts_cavendish_experiment_OR_hurricane_irma(Tail).

cavendish_experiment_OR_hurricane_irma_aux() :- findall((Start,End),cavendish_experiment(Start,End),Interval1), findall((Start,End),hurricane_irma(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cavendish_experiment_OR_hurricane_irma(Interval).

cavendish_experiment_OR_hurricane_irma_at_1669(Res) :- setof((Start,End),cavendish_experiment_OR_hurricane_irma(Start,End),AllINtervals), checkvalidity(1669,AllINtervals,Res).

check_query() :- write('Query = cavendish_experiment_OR_hurricane_irma_at_1669'), (cavendish_experiment_OR_hurricane_irma_at_1669(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cavendish_experiment_OR_hurricane_irma_aux().

