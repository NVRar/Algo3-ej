!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 12:58:16'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 13:01:48'!
test02AnElementIsAddedCorrectlyToTheStack

	| stack |
	
	stack := Stack new.
	stack push: 1.
	
	self deny: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 13:21:28'!
test03AnElementIsPoppedCorrectly

	| stack element |
	
	element := 1.
	stack := Stack new.
	stack push: element.
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 13:30:42'!
test04StackIsLIFO

	| stack |
	
	stack := Stack new.
	stack push: 1.
	stack push: 'hola'.
	
	self assert: stack pop = 'hola'.
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 13:28:20'!
test05TopElementIsCorrect

	| stack |
	
	stack := Stack new.
	stack push: 1.
	stack push: 'hola'.
	
	self assert: stack top = 'hola'.
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 17:17:33'!
test06CannotDoPopOnAnEmptyStack

	| stack |
	
	stack := Stack new.
	
	self should: [stack pop. self fail] raise: Error withExceptionDo: [:anError | self assert: Stack emptyStackDescription equals: anError messageText].
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 17:18:01'!
test07CannotDoTopOnAnEmptyStack

	| stack |
	
	stack := Stack new.
	
	self should: [stack top. self fail] raise: Error withExceptionDo: [:anError | self assert: Stack emptyStackDescription equals: anError messageText].
	! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 16:51:40'!
emptyCheck
	collection isEmpty ifTrue: [self errorEmptyStack]! !

!Stack methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 16:49:33'!
errorEmptyStack

	self error: self class emptyStackDescription! !

!Stack methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 12:58:26'!
initialize

	collection := OrderedCollection new.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 12:59:30'!
isEmpty

	^collection isEmpty.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 17:03:38'!
pop
	
	self emptyCheck.
	^collection removeLast! !

!Stack methodsFor: 'as yet unclassified' stamp: 'JP 10/6/2022 13:04:41'!
push: unElemento
	collection addLast: unElemento.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 17:09:29'!
top
	self emptyCheck.
	^collection at: collection size. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'as yet unclassified' stamp: 'MNC 10/6/2022 16:48:51'!
emptyStackDescription

	^ 'this stack is empty'! !
