:- include('database.pl').
second_anglo_afghan_war(Start,End) :- begin('second_anglo_afghan_war',_,_,Start), end('second_anglo_afghan_war',_,_,End), Start=<End.

salem_witch_trials(Start,End) :- begin('salem_witch_trials',_,_,Start), end('salem_witch_trials',_,_,End), Start=<End.

generate_facts_second_anglo_afghan_war_OR_salem_witch_trials([]) :- assert(second_anglo_afghan_war_OR_salem_witch_trials(-1,-1)).

generate_facts_second_anglo_afghan_war_OR_salem_witch_trials([(Start,End) | Tail]) :- assert(second_anglo_afghan_war_OR_salem_witch_trials(Start,End)), generate_facts_second_anglo_afghan_war_OR_salem_witch_trials(Tail).

second_anglo_afghan_war_OR_salem_witch_trials_aux() :- findall((Start,End),second_anglo_afghan_war(Start,End),Interval1), findall((Start,End),salem_witch_trials(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_anglo_afghan_war_OR_salem_witch_trials(Interval).

second_anglo_afghan_war_OR_salem_witch_trials_at_1700(Res) :- setof((Start,End),second_anglo_afghan_war_OR_salem_witch_trials(Start,End),AllINtervals), checkvalidity(1700,AllINtervals,Res).

check_query() :- write('Query = second_anglo_afghan_war_OR_salem_witch_trials_at_1700'), (second_anglo_afghan_war_OR_salem_witch_trials_at_1700(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_anglo_afghan_war_OR_salem_witch_trials_aux().

