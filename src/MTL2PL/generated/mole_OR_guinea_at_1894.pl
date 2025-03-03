:- include('database.pl').
mole(Start,End) :- begin('mole',_,_,Start), end('mole',_,_,End), Start=<End.

guinea(Start,End) :- begin('guinea',_,_,Start), end('guinea',_,_,End), Start=<End.

generate_facts_mole_OR_guinea([]) :- assert(mole_OR_guinea(-1,-1)).

generate_facts_mole_OR_guinea([(Start,End) | Tail]) :- assert(mole_OR_guinea(Start,End)), generate_facts_mole_OR_guinea(Tail).

mole_OR_guinea_aux() :- findall((Start,End),mole(Start,End),Interval1), findall((Start,End),guinea(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mole_OR_guinea(Interval).

mole_OR_guinea_at_1894(Res) :- setof((Start,End),mole_OR_guinea(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = mole_OR_guinea_at_1894'), (mole_OR_guinea_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mole_OR_guinea_aux().

