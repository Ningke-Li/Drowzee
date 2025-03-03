:- include('database.pl').
indonesian_national_revolution(Start,End) :- begin('indonesian_national_revolution',_,_,Start), end('indonesian_national_revolution',_,_,End), Start=<End.

wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

indonesian_national_revolution_last_till_2_9(Start,End) :- indonesian_national_revolution(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

indonesian_national_revolution_until_wirtschaftswunder_during_2_9_overlap(Start,End) :- indonesian_national_revolution_last_till_2_9(Start1,End1), wirtschaftswunder(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indonesian_national_revolution_until_wirtschaftswunder_during_2_9(Start,End) :- indonesian_national_revolution(W1,_), indonesian_national_revolution_until_wirtschaftswunder_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

indonesian_national_revolution_until_wirtschaftswunder_during_2_9_at_1865(Res) :- setof((Start,End),indonesian_national_revolution_until_wirtschaftswunder_during_2_9(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = indonesian_national_revolution_until_wirtschaftswunder_during_2_9_at_1865'), (indonesian_national_revolution_until_wirtschaftswunder_during_2_9_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

