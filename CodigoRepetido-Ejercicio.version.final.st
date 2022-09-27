!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:25:35'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.

	self should: [ customerBook addCustomerNamed: 'John Lennon' ] notTakeMoreThan: 50 milliSeconds.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:25:17'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook withAnActiveCostumer: paulMcCartney.
	
	self should: [ customerBook removeCustomerNamed: paulMcCartney ] notTakeMoreThan: 100 milliSeconds.		
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:24:44'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self should: [ customerBook addCustomerNamed: ''. self fail] raise: Error withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty]
		
	

	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:42:57'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook withAnActiveCostumer: johnLennon.

	self should: [ customerBook removeCustomerNamed: 'Paul McCartney' ] raise: NotFound withExceptionDo: [:anError | self assertNumberOfCustomers: 1 andIncludesCustomer: johnLennon of: customerBook ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:43:54'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook withAnActiveCostumer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertNumberOfActiveCustomers: 0 andNumberOfSuspendedCustomers: 1 andTotalCustomers: 1 of: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:44:06'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook withAnActiveCostumer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfActiveCustomers: 0 andNumberOfSuspendedCustomers: 0 andTotalCustomers: 0 of: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:23:46'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook withAnActiveCostumer: johnLennon.

	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr'. self fail ] raise: CantSuspend withExceptionDo: [:anError | self assertNumberOfCustomers: 1 andIncludesCustomer: johnLennon of: customerBook ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:23:32'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook withAnActiveCostumer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self should: [ customerBook suspendCustomerNamed: johnLennon. self fail ] raise: CantSuspend withExceptionDo: [:anError | self assertNumberOfCustomers: 1 andIncludesCustomer: johnLennon of: customerBook ]! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'MNC 9/27/2022 11:31:45'!
assertNumberOfActiveCustomers: numberOfActiveCustomers andNumberOfSuspendedCustomers: numberOfSuspendedCustomers andTotalCustomers: numberOfTotalCustomers of: aCustomerBook
	
	self assert: numberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfTotalCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'MNC 9/27/2022 11:06:54'!
assertNumberOfCustomers: aNumberOfCustomers andIncludesCustomer: aName of: aCustomerBook

	self assert: aCustomerBook numberOfCustomers = aNumberOfCustomers.
	self assert: (aCustomerBook includesCustomerNamed: aName ).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'MNC 9/27/2022 11:27:48'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !

!CustomerBook methodsFor: 'initialization' stamp: 'MNC 9/27/2022 11:12:17'!
initializeWithAnActiveCustomer: aName
	
	self initialize.
	active add: aName.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MNC 9/27/2022 11:27:31'!
addCustomerNamed: aName

	aName ifEmpty: [ self signalCustomerNameCannotBeEmpty ]. 
	( self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MNC 9/27/2022 11:28:08'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MNC 9/27/2022 11:28:28'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^ NotFound signal ] ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'MNC 9/27/2022 11:28:52'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName. 
	
	suspended add: aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'as yet unclassified' stamp: 'MNC 9/27/2022 11:12:24'!
withAnActiveCostumer: aName

	^self new initializeWithAnActiveCustomer: aName.! !
