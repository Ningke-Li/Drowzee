:- include('database.pl').
wuchang_uprising(Start,End) :- begin('wuchang_uprising',_,_,Start), end('wuchang_uprising',_,_,End), Start=<End.

american_revolution(Start,End) :- begin('american_revolution',_,_,Start), end('american_revolution',_,_,End), Start=<End.

generate_facts_wuchang_uprising_OR_american_revolution([]) :- assert(wuchang_uprising_OR_american_revolution(-1,-1)).

generate_facts_wuchang_uprising_OR_american_revolution([(Start,End) | Tail]) :- assert(wuchang_uprising_OR_american_revolution(Start,End)), generate_facts_wuchang_uprising_OR_american_revolution(Tail).

wuchang_uprising_OR_american_revolution_aux() :- findall((Start,End),wuchang_uprising(Start,End),Interval1), findall((Start,End),american_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_wuchang_uprising_OR_american_revolution(Interval).

wuchang_uprising_OR_american_revolution_at_1778(Res) :- setof((Start,End),wuchang_uprising_OR_american_revolution(Start,End),AllINtervals), checkvalidity(1778,AllINtervals,Res).

check_query() :- write('Query = wuchang_uprising_OR_american_revolution_at_1778'), (wuchang_uprising_OR_american_revolution_at_1778(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wuchang_uprising_OR_american_revolution_aux().

