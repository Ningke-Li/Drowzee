:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

occupation_of_the_ruhr(Start,End) :- begin('occupation_of_the_ruhr',_,_,Start), end('occupation_of_the_ruhr',_,_,End), Start=<End.

generate_facts_jackie_chan_adventures_OR_occupation_of_the_ruhr([]) :- assert(jackie_chan_adventures_OR_occupation_of_the_ruhr(-1,-1)).

generate_facts_jackie_chan_adventures_OR_occupation_of_the_ruhr([(Start,End) | Tail]) :- assert(jackie_chan_adventures_OR_occupation_of_the_ruhr(Start,End)), generate_facts_jackie_chan_adventures_OR_occupation_of_the_ruhr(Tail).

jackie_chan_adventures_OR_occupation_of_the_ruhr_aux() :- findall((Start,End),jackie_chan_adventures(Start,End),Interval1), findall((Start,End),occupation_of_the_ruhr(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_jackie_chan_adventures_OR_occupation_of_the_ruhr(Interval).

jackie_chan_adventures_OR_occupation_of_the_ruhr_at_1934(Res) :- setof((Start,End),jackie_chan_adventures_OR_occupation_of_the_ruhr(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = jackie_chan_adventures_OR_occupation_of_the_ruhr_at_1934'), (jackie_chan_adventures_OR_occupation_of_the_ruhr_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jackie_chan_adventures_OR_occupation_of_the_ruhr_aux().

