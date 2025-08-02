Class {
    #name : #RomanNumerals,
    #superclass: #Object,
    #category : #'Exercise@RomanNumerals'
}


{ #category : #'conversion' }
RomanNumerals >> romanNumber: arabicNumber [
    "Given an Arabic number, convert it to a Roman number by reducing and recurring."
    arabicNumber >= 1000 ifTrue: [ ^ 'M', (self romanNumber: arabicNumber - 1000)].
    arabicNumber >= 900 ifTrue: [ ^ 'CM', (self romanNumber: arabicNumber - 900)].
    arabicNumber >= 500 ifTrue: [ ^ 'D', (self romanNumber: arabicNumber - 500)].
    arabicNumber >= 400 ifTrue: [ ^ 'CD', (self romanNumber: arabicNumber - 400)].
    arabicNumber >= 100 ifTrue: [ ^ 'C', (self romanNumber: arabicNumber - 100)].  
    arabicNumber >= 90 ifTrue: [ ^ 'XC', (self romanNumber: arabicNumber - 90)].     
    arabicNumber >= 50 ifTrue: [ ^ 'L', (self romanNumber: arabicNumber - 50)]. 
    arabicNumber >= 40 ifTrue: [ ^ 'XL', (self romanNumber: arabicNumber - 40)].    
    arabicNumber >= 10 ifTrue: [ ^ 'X', (self romanNumber: arabicNumber - 10)].    
    arabicNumber >= 9 ifTrue: [ ^ 'IX', (self romanNumber: arabicNumber - 9)].
    arabicNumber >= 5 ifTrue: [ ^ 'V', (self romanNumber: arabicNumber - 5)].
    arabicNumber >= 4 ifTrue: [ ^ 'IV', (self romanNumber: arabicNumber - 4)].
    arabicNumber >= 1 ifTrue: [ ^ 'I', (self romanNumber: arabicNumber - 1)].
    ^ ''.
]