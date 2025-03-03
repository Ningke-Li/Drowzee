:- include('database.pl').
schmalkaldic_war(Start,End) :- begin('schmalkaldic_war',_,_,Start), end('schmalkaldic_war',_,_,End), Start=<End.

basketball_at_the_2004_summer_olympics(Start,End) :- begin('basketball_at_the_2004_summer_olympics',_,_,Start), end('basketball_at_the_2004_summer_olympics',_,_,End), Start=<End.

generate_facts_schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics([]) :- assert(schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics(-1,-1)).

generate_facts_schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics([(Start,End) | Tail]) :- assert(schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics(Start,End)), generate_facts_schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics(Tail).

schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics_aux() :- findall((Start,End),schmalkaldic_war(Start,End),Interval1), findall((Start,End),basketball_at_the_2004_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics(Interval).

schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics_at_1441(Res) :- setof((Start,End),schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics(Start,End),AllINtervals), checkvalidity(1441,AllINtervals,Res).

check_query() :- write('Query = schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics_at_1441'), (schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics_at_1441(true) -> write('\nRes   = true');write('\nRes   = false')).
?- schmalkaldic_war_OR_basketball_at_the_2004_summer_olympics_aux().

