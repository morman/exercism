namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc modifier {score} {
        # take score, divide by 2, floor, cast to an int, remove 5
        expr { int(floor($score / 2)) - 5 }
    }

    proc d6 {} {
        expr {1 + int(rand() * 6)}
    }

    proc ability {} {
        
        # roll 4d6 as a list        
        lappend rolls [d6]
        lappend rolls [d6]
        lappend rolls [d6]
        lappend rolls [d6]    
        
        # sort rolls lowest to highest 
        set rolls [lsort -integer $rolls]          

        # remove first element
        set rolls [lreplace $rolls 0 0]

        # initialize sum
        set sum 0

        # loop over rolls array, adding elements
        foreach roll $rolls {
            set sum [expr {$sum + $roll}] 
        }

        return $sum 
    }

    proc hps {con} {
        # 10 HPs, plus or minus CON modifier
        expr {10 + [modifier $con]}
    }

    proc character {} {
        # create character
        set character [dict create]
        # set stats
        dict set character strength [ability]
        dict set character dexterity [ability]
        dict set character constitution [ability]
        dict set character intelligence [ability]
        dict set character wisdom [ability]
        dict set character charisma [ability]
        # set HPs, adjusted by CON modifier  
        dict set character hitpoints [hps [dict get $character constitution]]
        
        return $character
    }
}
