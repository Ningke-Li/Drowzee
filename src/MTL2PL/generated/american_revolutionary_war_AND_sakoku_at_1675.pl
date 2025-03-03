:- include('database.pl').
american_revolutionary_war(Start,End) :- begin('american_revolutionary_war',_,_,Start), end('american_revolutionary_war',_,_,End), Start=<End.

sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

generate_facts_american_revolutionary_war_AND_sakoku([]) :- assert(american_revolutionary_war_AND_sakoku(-1,-1)).

generate_facts_american_revolutionary_war_AND_sakoku([(Start,End) | Tail]) :- assert(american_revolutionary_war_AND_sakoku(Start,End)), generate_facts_american_revolutionary_war_AND_sakoku(Tail).

american_revolutionary_war_AND_sakoku_aux() :- findall((Start,End),american_revolutionary_war(Start,End),Interval1), findall((Start,End),sakoku(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_american_revolutionary_war_AND_sakoku(Interval).

american_revolutionary_war_AND_sakoku_at_1675(Res) :- setof((Start,End),american_revolutionary_war_AND_sakoku(Start,End),AllINtervals), checkvalidity(1675,AllINtervals,Res).

check_query() :- write('Query = american_revolutionary_war_AND_sakoku_at_1675'), (american_revolutionary_war_AND_sakoku_at_1675(true) -> write('\nRes   = true');write('\nRes   = false')).
?- american_revolutionary_war_AND_sakoku_aux().

