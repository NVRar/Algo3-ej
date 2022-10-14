!classDefinition: #OOStackLimitedTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackLimitedTest
	instanceVariableNames: 'stack secondPushedObject firstPushedObject thirdPushedObject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimitedTest methodsFor: 'setup' stamp: 'MNC 10/14/2022 14:19:48'!
setUp

	stack := OOStackLimited ofSize: 2.
	firstPushedObject := 'something'.
	secondPushedObject := 'boca'.
	thirdPushedObject := 'river'.! !


!OOStackLimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:40:37'!
test01PushAddElementsToANonFullStack

	stack push: firstPushedObject .
	
	self deny: stack isEmpty! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:22:21'!
test02PushAddElementsToAFullStackShouldRaiseAnError

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self
		should: [ stack push: thirdPushedObject ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: OOStackLimited maxCapacityReachedErrorDescription equals: anError messageText ].
! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:22:28'!
test03PushAddElementsToAFullStackShouldNotChangeTheStack

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self
		should: [ stack push: thirdPushedObject ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: OOStackLimited maxCapacityReachedErrorDescription equals: anError messageText ].
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
		
	
! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:44:14'!
test04IsPossibleToRemoveFromAFullStackAndReAdd

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack pop.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
		
	
! !


!classDefinition: #OOStackUnlimitedTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackUnlimitedTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:12'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStackUnlimited new.
	
	self assert: stack isEmpty! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:16'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStackUnlimited new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:20'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStackUnlimited new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:23'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:27'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStackUnlimited new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:31'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:52'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackUnlimited new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:28:59'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackUnlimitedTest methodsFor: 'test' stamp: 'MNC 10/14/2022 14:29:03'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackUnlimited new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack firstPushedObject secondPushedObject thirdPushedObject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:04:17'!
test01FindASentenceStartingWithAPrefixInStack

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'fir' on: stack.
	
	self assert: ((SentenceFinder find at: 1 ) isEqualTo: firstPushedObject ).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:04:11'!
test02FindASentenceNoStartingWithAPrefixInStack

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'case' on: stack.
	
	self assert: ((SentenceFinder find) isEmpty ).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:04:05'!
test03SearchForAnNonExistentPrefixReturnAnEmptyCollection

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'hola' on: stack.
	self assert: (SentenceFinder find isEmpty).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:03:23'!
test04SearchForAPrefixWithAnEmptySpaceShouldRaiseAnError

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self
		should: [ SentenceFinderByPrefix with: ' ' on: stack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix cannotSearchWithAnEmptySpaceOnPrefixErrorDescription equals: anError messageText ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:03:53'!
test05SearchForAnEmptyPrefixShouldRaiseAnError

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self
		should: [ SentenceFinderByPrefix with: '' on: stack. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix cannotSearchWithAnEmptyPrefixErrorDescription equals: anError messageText ]
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:03:23'!
test06SearchForAnExistentSentenceStartingWithPrefixShouldNotChangeTheStack

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'sec' on: stack.
	
	self assert: (((SentenceFinder find) at: 1) isEqualTo: secondPushedObject ).
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:03:23'!
test07SearchForANonExistentSentenceStartingWithPrefixShouldNotChangeTheStack

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'hola' on: stack.
	
	self assert: ((SentenceFinder find) isEmpty).
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:03:23'!
test08IsPossibleToSearchForAPrefixOnAnEmptyStack

	| SentenceFinder|
	
	SentenceFinder := SentenceFinderByPrefix with: 'hola' on: stack.
	
	self assert: ((SentenceFinder find) isEmpty ).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MNC 10/14/2022 13:57:29'!
test09FindSentencesStartingWithAPrefixInStack

	| SentenceFinder|
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	stack push: thirdPushedObject.
	
	SentenceFinder := SentenceFinderByPrefix with: 'fir' on: stack.
	
	self assert: ((SentenceFinder find at: 1 ) isEqualTo: thirdPushedObject ).
	self assert: ((SentenceFinder find at: 2 ) isEqualTo: firstPushedObject ).! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'MNC 10/14/2022 13:55:27'!
setUp

	stack := OOStack new.
	firstPushedObject := 'first case'.
	secondPushedObject := 'second case'.
	thirdPushedObject := 'first'.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accesing' stamp: 'MNC 10/14/2022 14:25:38'!
isEmpty

	^top isBase! !

!OOStack methodsFor: 'accesing' stamp: 'MNC 10/14/2022 14:26:11'!
size

	^top size ! !


!OOStack methodsFor: 'initialization' stamp: 'MNC 10/14/2022 14:25:22'!
initialize

	top := Base new.! !


!OOStack methodsFor: 'operations' stamp: 'MNC 10/14/2022 14:25:55'!
pop
	
	| content |
	
 	content := self top.
	top := top previous.
	^content
	
	
! !

!OOStack methodsFor: 'operations' stamp: 'MNC 10/14/2022 14:16:23'!
push: anElement
	
	self subclassResponsibility 
! !

!OOStack methodsFor: 'operations' stamp: 'MNC 10/14/2022 14:26:25'!
top

	^top value
	! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: 'maxCapacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'initialization' stamp: 'MNC 10/14/2022 14:29:33'!
initializeOfSize: aSize

	self initialize.
	maxCapacity := aSize.! !


!OOStackLimited methodsFor: 'operations' stamp: 'MNC 10/14/2022 14:14:56'!
push: anElement
	
	self checkCapacity.
	top := Elemento with: anElement over: top
! !


!OOStackLimited methodsFor: 'private' stamp: 'MNC 10/14/2022 14:32:08'!
checkCapacity

	(self size >= maxCapacity) ifTrue: [ self errorMaxCapacityReached ].! !

!OOStackLimited methodsFor: 'private' stamp: 'MNC 10/14/2022 14:14:56'!
errorMaxCapacityReached

	self error: self class maxCapacityReachedErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'MNC 10/14/2022 14:14:56'!
maxCapacityReachedErrorDescription

	^'Stack max capacity reachead'.! !


!OOStackLimited class methodsFor: 'instance creation' stamp: 'MNC 10/14/2022 14:14:57'!
ofSize: aSize
	
	^ self new initializeOfSize: aSize! !


!classDefinition: #OOStackUnlimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackUnlimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimited methodsFor: 'operations' stamp: 'MNC 10/14/2022 14:17:40'!
push: anElement
	
	top := Elemento with: anElement over: top
! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack temporaryStack prefix foundedSentencesWithPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MNC 10/14/2022 13:07:11'!
addSentencesWithPrefixToFoundedCollection
	
	|actual result|
	
	actual := stack pop. 
	result := actual beginsWith: prefix.
	temporaryStack push: actual.
	
	result ifTrue: [ foundedSentencesWithPrefix add: actual]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MNC 10/14/2022 13:08:01'!
findSentencesWithPrefix

	[stack isEmpty] whileFalse: [ self addSentencesWithPrefixToFoundedCollection ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MNC 10/13/2022 11:29:35'!
reorganizeStack

	[temporaryStack isEmpty] whileFalse: [ stack push: temporaryStack pop ]! !


!SentenceFinderByPrefix methodsFor: 'operation' stamp: 'MNC 10/14/2022 13:07:24'!
find

	self findSentencesWithPrefix.
	self reorganizeStack.
	^foundedSentencesWithPrefix 
	
	! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'MNC 10/14/2022 13:07:11'!
initializeWith: aPrefix on: aStack

	prefix := aPrefix.
	stack := aStack.
	temporaryStack := OOStack new.
	foundedSentencesWithPrefix := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/13/2022 15:31:33'!
assertNotEmptyPrefix: aPrefix

	(aPrefix isEqualTo: '') ifTrue: [ self error: self cannotSearchWithAnEmptyPrefixErrorDescription ]! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/13/2022 15:41:00'!
assertPrefixDoNotHaveEmptySpaces: aPrefix

	((aPrefix findString: ' ') isNotEqualTo: 0 ) ifTrue: [ self error: self cannotSearchWithAnEmptySpaceOnPrefixErrorDescription ]! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/13/2022 10:13:40'!
cannotSearchWithAnEmptyPrefixErrorDescription

	^'Cannot search with an empty prefix'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/13/2022 10:23:11'!
cannotSearchWithAnEmptySpaceOnPrefixErrorDescription

	^'Cannot search with an empty space on prefix'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/12/2022 11:52:33'!
prefixNotFoundErrorDescription

	^'Prefix not found at stack'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MNC 10/13/2022 15:33:11'!
with: aPrefix on: aStack

	self assertNotEmptyPrefix: aPrefix.
	self assertPrefixDoNotHaveEmptySpaces: aPrefix.

	^self new initializeWith: aPrefix on: aStack.! !


!classDefinition: #Tope category: 'Stack-Exercise'!
Object subclass: #Tope
	instanceVariableNames: 'content previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Tope methodsFor: 'accesing' stamp: 'MNC 10/11/2022 21:00:53'!
isBase

	^self subclassResponsibility ! !

!Tope methodsFor: 'accesing' stamp: 'MNC 10/13/2022 12:04:19'!
previous

	self subclassResponsibility ! !

!Tope methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:50:20'!
size

	self subclassResponsibility ! !

!Tope methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:30:00'!
value

	self subclassResponsibility ! !


!classDefinition: #Base category: 'Stack-Exercise'!
Tope subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:41:04'!
errorBaseCannotReturnAnElement

	self error: self class baseCannotReturnErrorDescription! !

!Base methodsFor: 'accesing' stamp: 'MNC 10/11/2022 21:01:11'!
isBase

	^true! !

!Base methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:50:36'!
size

	^0! !

!Base methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:36:29'!
value

	self errorBaseCannotReturnAnElement ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'Stack-Exercise'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'errorDescription' stamp: 'MNC 10/13/2022 12:46:02'!
baseCannotReturnErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #Elemento category: 'Stack-Exercise'!
Tope subclass: #Elemento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Elemento methodsFor: 'accesing' stamp: 'MNC 10/11/2022 21:01:25'!
isBase

	^false! !

!Elemento methodsFor: 'accesing' stamp: 'MNC 10/13/2022 12:04:20'!
previous

	^previous ! !

!Elemento methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:51:56'!
size

	^1 + previous size! !

!Elemento methodsFor: 'accesing' stamp: 'MNC 10/12/2022 09:47:44'!
value

	^content ! !


!Elemento methodsFor: 'initialization' stamp: 'MNC 10/12/2022 09:47:44'!
initializeWith: anElement over: lastElement

	content := anElement.
	previous := lastElement.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Elemento class' category: 'Stack-Exercise'!
Elemento class
	instanceVariableNames: ''!

!Elemento class methodsFor: 'instance creation' stamp: 'MNC 10/11/2022 21:26:50'!
with: anElement over: lastElement

	^ Elemento new initializeWith: anElement over: lastElement! !
