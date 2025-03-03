:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

generate_facts_cypriot_pound_AND_xinhai_revolution([]) :- assert(cypriot_pound_AND_xinhai_revolution(-1,-1)).

generate_facts_cypriot_pound_AND_xinhai_revolution([(Start,End) | Tail]) :- assert(cypriot_pound_AND_xinhai_revolution(Start,End)), generate_facts_cypriot_pound_AND_xinhai_revolution(Tail).

cypriot_pound_AND_xinhai_revolution_aux() :- findall((Start,End),cypriot_pound(Start,End),Interval1), findall((Start,End),xinhai_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_cypriot_pound_AND_xinhai_revolution(Interval).

cypriot_pound_AND_xinhai_revolution_at_1912(Res) :- setof((Start,End),cypriot_pound_AND_xinhai_revolution(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = cypriot_pound_AND_xinhai_revolution_at_1912'), (cypriot_pound_AND_xinhai_revolution_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cypriot_pound_AND_xinhai_revolution_aux().

