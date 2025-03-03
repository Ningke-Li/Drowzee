:- include('database.pl').
boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

russo_japanese_war(Start,End) :- begin('russo_japanese_war',_,_,Start), end('russo_japanese_war',_,_,End), Start=<End.

generate_facts_boston_legal_OR_russo_japanese_war([]) :- assert(boston_legal_OR_russo_japanese_war(-1,-1)).

generate_facts_boston_legal_OR_russo_japanese_war([(Start,End) | Tail]) :- assert(boston_legal_OR_russo_japanese_war(Start,End)), generate_facts_boston_legal_OR_russo_japanese_war(Tail).

boston_legal_OR_russo_japanese_war_aux() :- findall((Start,End),boston_legal(Start,End),Interval1), findall((Start,End),russo_japanese_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_boston_legal_OR_russo_japanese_war(Interval).

boston_legal_OR_russo_japanese_war_at_1893(Res) :- setof((Start,End),boston_legal_OR_russo_japanese_war(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = boston_legal_OR_russo_japanese_war_at_1893'), (boston_legal_OR_russo_japanese_war_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).
?- boston_legal_OR_russo_japanese_war_aux().

