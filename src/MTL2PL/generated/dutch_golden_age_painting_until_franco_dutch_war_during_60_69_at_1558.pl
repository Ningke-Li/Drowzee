:- include('database.pl').
dutch_golden_age_painting(Start,End) :- begin('dutch_golden_age_painting',_,_,Start), end('dutch_golden_age_painting',_,_,End), Start=<End.

franco_dutch_war(Start,End) :- begin('franco_dutch_war',_,_,Start), end('franco_dutch_war',_,_,End), Start=<End.

dutch_golden_age_painting_last_till_60_69(Start,End) :- dutch_golden_age_painting(Start1,End1), (End1-Start1)>=60, Start is (Start1+60), End is (End1+1).

dutch_golden_age_painting_until_franco_dutch_war_during_60_69_overlap(Start,End) :- dutch_golden_age_painting_last_till_60_69(Start1,End1), franco_dutch_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_golden_age_painting_until_franco_dutch_war_during_60_69(Start,End) :- dutch_golden_age_painting(W1,_), dutch_golden_age_painting_until_franco_dutch_war_during_60_69_overlap(Start1,End1), Start is max((Start1-69),W1), End is (End1-60), Start=<End.

dutch_golden_age_painting_until_franco_dutch_war_during_60_69_at_1558(Res) :- setof((Start,End),dutch_golden_age_painting_until_franco_dutch_war_during_60_69(Start,End),AllINtervals), checkvalidity(1558,AllINtervals,Res).

check_query() :- write('Query = dutch_golden_age_painting_until_franco_dutch_war_during_60_69_at_1558'), (dutch_golden_age_painting_until_franco_dutch_war_during_60_69_at_1558(true) -> write('\nRes   = true');write('\nRes   = false')).

