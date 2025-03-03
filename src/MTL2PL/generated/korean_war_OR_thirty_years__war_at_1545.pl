:- include('database.pl').
korean_war(Start,End) :- begin('korean_war',_,_,Start), end('korean_war',_,_,End), Start=<End.

thirty_years__war(Start,End) :- begin('thirty_years__war',_,_,Start), end('thirty_years__war',_,_,End), Start=<End.

generate_facts_korean_war_OR_thirty_years__war([]) :- assert(korean_war_OR_thirty_years__war(-1,-1)).

generate_facts_korean_war_OR_thirty_years__war([(Start,End) | Tail]) :- assert(korean_war_OR_thirty_years__war(Start,End)), generate_facts_korean_war_OR_thirty_years__war(Tail).

korean_war_OR_thirty_years__war_aux() :- findall((Start,End),korean_war(Start,End),Interval1), findall((Start,End),thirty_years__war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_korean_war_OR_thirty_years__war(Interval).

korean_war_OR_thirty_years__war_at_1545(Res) :- setof((Start,End),korean_war_OR_thirty_years__war(Start,End),AllINtervals), checkvalidity(1545,AllINtervals,Res).

check_query() :- write('Query = korean_war_OR_thirty_years__war_at_1545'), (korean_war_OR_thirty_years__war_at_1545(true) -> write('\nRes   = true');write('\nRes   = false')).
?- korean_war_OR_thirty_years__war_aux().

