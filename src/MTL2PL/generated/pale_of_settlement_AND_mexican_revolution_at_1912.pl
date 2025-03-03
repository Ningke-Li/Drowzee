:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

generate_facts_pale_of_settlement_AND_mexican_revolution([]) :- assert(pale_of_settlement_AND_mexican_revolution(-1,-1)).

generate_facts_pale_of_settlement_AND_mexican_revolution([(Start,End) | Tail]) :- assert(pale_of_settlement_AND_mexican_revolution(Start,End)), generate_facts_pale_of_settlement_AND_mexican_revolution(Tail).

pale_of_settlement_AND_mexican_revolution_aux() :- findall((Start,End),pale_of_settlement(Start,End),Interval1), findall((Start,End),mexican_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pale_of_settlement_AND_mexican_revolution(Interval).

pale_of_settlement_AND_mexican_revolution_at_1912(Res) :- setof((Start,End),pale_of_settlement_AND_mexican_revolution(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_AND_mexican_revolution_at_1912'), (pale_of_settlement_AND_mexican_revolution_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pale_of_settlement_AND_mexican_revolution_aux().

