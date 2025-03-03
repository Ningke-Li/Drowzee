:- include('database.pl').
expo_2010_shanghai_china(Start,End) :- begin('expo_2010_shanghai_china',_,_,Start), end('expo_2010_shanghai_china',_,_,End), Start=<End.

entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

generate_facts_expo_2010_shanghai_china_OR_entourage([]) :- assert(expo_2010_shanghai_china_OR_entourage(-1,-1)).

generate_facts_expo_2010_shanghai_china_OR_entourage([(Start,End) | Tail]) :- assert(expo_2010_shanghai_china_OR_entourage(Start,End)), generate_facts_expo_2010_shanghai_china_OR_entourage(Tail).

expo_2010_shanghai_china_OR_entourage_aux() :- findall((Start,End),expo_2010_shanghai_china(Start,End),Interval1), findall((Start,End),entourage(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_expo_2010_shanghai_china_OR_entourage(Interval).

expo_2010_shanghai_china_OR_entourage_at_1967(Res) :- setof((Start,End),expo_2010_shanghai_china_OR_entourage(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = expo_2010_shanghai_china_OR_entourage_at_1967'), (expo_2010_shanghai_china_OR_entourage_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).
?- expo_2010_shanghai_china_OR_entourage_aux().

