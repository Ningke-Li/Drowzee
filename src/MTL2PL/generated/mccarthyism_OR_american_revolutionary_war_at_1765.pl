:- include('database.pl').
mccarthyism(Start,End) :- begin('mccarthyism',_,_,Start), end('mccarthyism',_,_,End), Start=<End.

american_revolutionary_war(Start,End) :- begin('american_revolutionary_war',_,_,Start), end('american_revolutionary_war',_,_,End), Start=<End.

generate_facts_mccarthyism_OR_american_revolutionary_war([]) :- assert(mccarthyism_OR_american_revolutionary_war(-1,-1)).

generate_facts_mccarthyism_OR_american_revolutionary_war([(Start,End) | Tail]) :- assert(mccarthyism_OR_american_revolutionary_war(Start,End)), generate_facts_mccarthyism_OR_american_revolutionary_war(Tail).

mccarthyism_OR_american_revolutionary_war_aux() :- findall((Start,End),mccarthyism(Start,End),Interval1), findall((Start,End),american_revolutionary_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mccarthyism_OR_american_revolutionary_war(Interval).

mccarthyism_OR_american_revolutionary_war_at_1765(Res) :- setof((Start,End),mccarthyism_OR_american_revolutionary_war(Start,End),AllINtervals), checkvalidity(1765,AllINtervals,Res).

check_query() :- write('Query = mccarthyism_OR_american_revolutionary_war_at_1765'), (mccarthyism_OR_american_revolutionary_war_at_1765(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mccarthyism_OR_american_revolutionary_war_aux().

