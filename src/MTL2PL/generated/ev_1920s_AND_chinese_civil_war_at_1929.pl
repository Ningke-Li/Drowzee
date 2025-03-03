:- include('database.pl').
ev_1920s(Start,End) :- begin('ev_1920s',_,_,Start), end('ev_1920s',_,_,End), Start=<End.

chinese_civil_war(Start,End) :- begin('chinese_civil_war',_,_,Start), end('chinese_civil_war',_,_,End), Start=<End.

generate_facts_ev_1920s_AND_chinese_civil_war([]) :- assert(ev_1920s_AND_chinese_civil_war(-1,-1)).

generate_facts_ev_1920s_AND_chinese_civil_war([(Start,End) | Tail]) :- assert(ev_1920s_AND_chinese_civil_war(Start,End)), generate_facts_ev_1920s_AND_chinese_civil_war(Tail).

ev_1920s_AND_chinese_civil_war_aux() :- findall((Start,End),ev_1920s(Start,End),Interval1), findall((Start,End),chinese_civil_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1920s_AND_chinese_civil_war(Interval).

ev_1920s_AND_chinese_civil_war_at_1929(Res) :- setof((Start,End),ev_1920s_AND_chinese_civil_war(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = ev_1920s_AND_chinese_civil_war_at_1929'), (ev_1920s_AND_chinese_civil_war_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1920s_AND_chinese_civil_war_aux().

