:- include('database.pl').
ouran_high_school_host_club(Start,End) :- begin('ouran_high_school_host_club',_,_,Start), end('ouran_high_school_host_club',_,_,End), Start=<End.

psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

ouran_high_school_host_club_last_till_3_5(Start,End) :- ouran_high_school_host_club(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

ouran_high_school_host_club_until_psych_during_3_5_overlap(Start,End) :- ouran_high_school_host_club_last_till_3_5(Start1,End1), psych(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ouran_high_school_host_club_until_psych_during_3_5(Start,End) :- ouran_high_school_host_club(W1,_), ouran_high_school_host_club_until_psych_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

ouran_high_school_host_club_until_psych_during_3_5_at_2007(Res) :- setof((Start,End),ouran_high_school_host_club_until_psych_during_3_5(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ouran_high_school_host_club_until_psych_during_3_5_at_2007'), (ouran_high_school_host_club_until_psych_during_3_5_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

