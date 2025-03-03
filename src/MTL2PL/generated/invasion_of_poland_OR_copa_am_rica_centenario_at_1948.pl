:- include('database.pl').
invasion_of_poland(Start,End) :- begin('invasion_of_poland',_,_,Start), end('invasion_of_poland',_,_,End), Start=<End.

copa_am_rica_centenario(Start,End) :- begin('copa_am_rica_centenario',_,_,Start), end('copa_am_rica_centenario',_,_,End), Start=<End.

generate_facts_invasion_of_poland_OR_copa_am_rica_centenario([]) :- assert(invasion_of_poland_OR_copa_am_rica_centenario(-1,-1)).

generate_facts_invasion_of_poland_OR_copa_am_rica_centenario([(Start,End) | Tail]) :- assert(invasion_of_poland_OR_copa_am_rica_centenario(Start,End)), generate_facts_invasion_of_poland_OR_copa_am_rica_centenario(Tail).

invasion_of_poland_OR_copa_am_rica_centenario_aux() :- findall((Start,End),invasion_of_poland(Start,End),Interval1), findall((Start,End),copa_am_rica_centenario(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_invasion_of_poland_OR_copa_am_rica_centenario(Interval).

invasion_of_poland_OR_copa_am_rica_centenario_at_1948(Res) :- setof((Start,End),invasion_of_poland_OR_copa_am_rica_centenario(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = invasion_of_poland_OR_copa_am_rica_centenario_at_1948'), (invasion_of_poland_OR_copa_am_rica_centenario_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- invasion_of_poland_OR_copa_am_rica_centenario_aux().

