:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

italian_lira_last_till_75_83(Start,End) :- italian_lira(Start1,End1), (End1-Start1)>=75, Start is (Start1+75), End is (End1+1).

italian_lira_until_manhattan_project_during_75_83_overlap(Start,End) :- italian_lira_last_till_75_83(Start1,End1), manhattan_project(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_lira_until_manhattan_project_during_75_83(Start,End) :- italian_lira(W1,_), italian_lira_until_manhattan_project_during_75_83_overlap(Start1,End1), Start is max((Start1-83),W1), End is (End1-75), Start=<End.

italian_lira_until_manhattan_project_during_75_83_at_1874(Res) :- setof((Start,End),italian_lira_until_manhattan_project_during_75_83(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = italian_lira_until_manhattan_project_during_75_83_at_1874'), (italian_lira_until_manhattan_project_during_75_83_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).

