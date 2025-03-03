:- include('database.pl').
haikyu__(Start,End) :- begin('haikyu__',_,_,Start), end('haikyu__',_,_,End), Start=<End.

the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

haikyu___last_till_1_7(Start,End) :- haikyu__(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

haikyu___until_the_lion_guard_during_1_7_overlap(Start,End) :- haikyu___last_till_1_7(Start1,End1), the_lion_guard(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

haikyu___until_the_lion_guard_during_1_7(Start,End) :- haikyu__(W1,_), haikyu___until_the_lion_guard_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

haikyu___until_the_lion_guard_during_1_7_at_2013(Res) :- setof((Start,End),haikyu___until_the_lion_guard_during_1_7(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = haikyu___until_the_lion_guard_during_1_7_at_2013'), (haikyu___until_the_lion_guard_during_1_7_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

