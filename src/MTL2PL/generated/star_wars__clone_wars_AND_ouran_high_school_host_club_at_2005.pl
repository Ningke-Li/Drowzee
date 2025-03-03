:- include('database.pl').
star_wars__clone_wars(Start,End) :- begin('star_wars__clone_wars',_,_,Start), end('star_wars__clone_wars',_,_,End), Start=<End.

ouran_high_school_host_club(Start,End) :- begin('ouran_high_school_host_club',_,_,Start), end('ouran_high_school_host_club',_,_,End), Start=<End.

generate_facts_star_wars__clone_wars_AND_ouran_high_school_host_club([]) :- assert(star_wars__clone_wars_AND_ouran_high_school_host_club(-1,-1)).

generate_facts_star_wars__clone_wars_AND_ouran_high_school_host_club([(Start,End) | Tail]) :- assert(star_wars__clone_wars_AND_ouran_high_school_host_club(Start,End)), generate_facts_star_wars__clone_wars_AND_ouran_high_school_host_club(Tail).

star_wars__clone_wars_AND_ouran_high_school_host_club_aux() :- findall((Start,End),star_wars__clone_wars(Start,End),Interval1), findall((Start,End),ouran_high_school_host_club(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_star_wars__clone_wars_AND_ouran_high_school_host_club(Interval).

star_wars__clone_wars_AND_ouran_high_school_host_club_at_2005(Res) :- setof((Start,End),star_wars__clone_wars_AND_ouran_high_school_host_club(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = star_wars__clone_wars_AND_ouran_high_school_host_club_at_2005'), (star_wars__clone_wars_AND_ouran_high_school_host_club_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- star_wars__clone_wars_AND_ouran_high_school_host_club_aux().

