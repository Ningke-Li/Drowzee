:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

attack_on_titan(Start,End) :- begin('attack_on_titan',_,_,Start), end('attack_on_titan',_,_,End), Start=<End.

psych_last_till_1_10(Start,End) :- psych(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

psych_until_attack_on_titan_during_1_10_overlap(Start,End) :- psych_last_till_1_10(Start1,End1), attack_on_titan(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_attack_on_titan_during_1_10(Start,End) :- psych(W1,_), psych_until_attack_on_titan_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

psych_until_attack_on_titan_during_1_10_at_1862(Res) :- setof((Start,End),psych_until_attack_on_titan_during_1_10(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = psych_until_attack_on_titan_during_1_10_at_1862'), (psych_until_attack_on_titan_during_1_10_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

