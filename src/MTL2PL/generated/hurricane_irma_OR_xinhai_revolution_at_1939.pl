:- include('database.pl').
hurricane_irma(Start,End) :- begin('hurricane_irma',_,_,Start), end('hurricane_irma',_,_,End), Start=<End.

xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

generate_facts_hurricane_irma_OR_xinhai_revolution([]) :- assert(hurricane_irma_OR_xinhai_revolution(-1,-1)).

generate_facts_hurricane_irma_OR_xinhai_revolution([(Start,End) | Tail]) :- assert(hurricane_irma_OR_xinhai_revolution(Start,End)), generate_facts_hurricane_irma_OR_xinhai_revolution(Tail).

hurricane_irma_OR_xinhai_revolution_aux() :- findall((Start,End),hurricane_irma(Start,End),Interval1), findall((Start,End),xinhai_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hurricane_irma_OR_xinhai_revolution(Interval).

hurricane_irma_OR_xinhai_revolution_at_1939(Res) :- setof((Start,End),hurricane_irma_OR_xinhai_revolution(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = hurricane_irma_OR_xinhai_revolution_at_1939'), (hurricane_irma_OR_xinhai_revolution_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hurricane_irma_OR_xinhai_revolution_aux().

