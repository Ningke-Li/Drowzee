:- include('database.pl').
hannibal(Start,End) :- begin('hannibal',_,_,Start), end('hannibal',_,_,End), Start=<End.

first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

generate_facts_hannibal_OR_first_schleswig_war([]) :- assert(hannibal_OR_first_schleswig_war(-1,-1)).

generate_facts_hannibal_OR_first_schleswig_war([(Start,End) | Tail]) :- assert(hannibal_OR_first_schleswig_war(Start,End)), generate_facts_hannibal_OR_first_schleswig_war(Tail).

hannibal_OR_first_schleswig_war_aux() :- findall((Start,End),hannibal(Start,End),Interval1), findall((Start,End),first_schleswig_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hannibal_OR_first_schleswig_war(Interval).

hannibal_OR_first_schleswig_war_at_1712(Res) :- setof((Start,End),hannibal_OR_first_schleswig_war(Start,End),AllINtervals), checkvalidity(1712,AllINtervals,Res).

check_query() :- write('Query = hannibal_OR_first_schleswig_war_at_1712'), (hannibal_OR_first_schleswig_war_at_1712(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hannibal_OR_first_schleswig_war_aux().

