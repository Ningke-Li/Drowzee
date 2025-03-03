:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

persian_constitutional_revolution(Start,End) :- begin('persian_constitutional_revolution',_,_,Start), end('persian_constitutional_revolution',_,_,End), Start=<End.

generate_facts_orient_express_AND_persian_constitutional_revolution([]) :- assert(orient_express_AND_persian_constitutional_revolution(-1,-1)).

generate_facts_orient_express_AND_persian_constitutional_revolution([(Start,End) | Tail]) :- assert(orient_express_AND_persian_constitutional_revolution(Start,End)), generate_facts_orient_express_AND_persian_constitutional_revolution(Tail).

orient_express_AND_persian_constitutional_revolution_aux() :- findall((Start,End),orient_express(Start,End),Interval1), findall((Start,End),persian_constitutional_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orient_express_AND_persian_constitutional_revolution(Interval).

orient_express_AND_persian_constitutional_revolution_at_1949(Res) :- setof((Start,End),orient_express_AND_persian_constitutional_revolution(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = orient_express_AND_persian_constitutional_revolution_at_1949'), (orient_express_AND_persian_constitutional_revolution_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orient_express_AND_persian_constitutional_revolution_aux().

