:- include('database.pl').
bosnian_crisis(Start,End) :- begin('bosnian_crisis',_,_,Start), end('bosnian_crisis',_,_,End), Start=<End.

stockholm_bloodbath(Start,End) :- begin('stockholm_bloodbath',_,_,Start), end('stockholm_bloodbath',_,_,End), Start=<End.

generate_facts_bosnian_crisis_OR_stockholm_bloodbath([]) :- assert(bosnian_crisis_OR_stockholm_bloodbath(-1,-1)).

generate_facts_bosnian_crisis_OR_stockholm_bloodbath([(Start,End) | Tail]) :- assert(bosnian_crisis_OR_stockholm_bloodbath(Start,End)), generate_facts_bosnian_crisis_OR_stockholm_bloodbath(Tail).

bosnian_crisis_OR_stockholm_bloodbath_aux() :- findall((Start,End),bosnian_crisis(Start,End),Interval1), findall((Start,End),stockholm_bloodbath(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bosnian_crisis_OR_stockholm_bloodbath(Interval).

bosnian_crisis_OR_stockholm_bloodbath_at_1908(Res) :- setof((Start,End),bosnian_crisis_OR_stockholm_bloodbath(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = bosnian_crisis_OR_stockholm_bloodbath_at_1908'), (bosnian_crisis_OR_stockholm_bloodbath_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bosnian_crisis_OR_stockholm_bloodbath_aux().

