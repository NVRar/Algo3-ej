!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:33:28'!
test01PortfolioWithoutAnAccountHasNoMoney

	|portfolio|
	portfolio := Portfolio new.
	
	self assert: (portfolio balance = (0 * peso)).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:34:07'!
test02PortfolioWithAnAccountHasExpectedBalance

	|portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio addAccount: account.
	
	
	self assert: (portfolio balance = (100 * peso)).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:34:56'!
test03PortfolioWithAccountsHasExpectedBalance

	|portfolio account account2|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Deposit register: 50 * peso on: account2.
	
	portfolio addAccount: account.
	portfolio addAccount: account2.
	
	self assert: (portfolio balance = (150 * peso)).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:35:34'!
test04PortfolioCanRegistedOperations

	|portfolio account deposit|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	deposit := Deposit register: 100 * peso on: account.

	portfolio addAccount: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:38:28'!
test07PortfolioWithAccountsKnowsAllTheTransactions

	|portfolio account1 account2 deposit1 deposit2 withdraw1 transactions|
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addAccount: account1.
	portfolio addAccount: account2.
	
	deposit1 := Deposit register: 100 * peso on: account1.
	withdraw1 := Withdraw register: 50 * peso on: account1.
	deposit2 := Deposit register: 50 * peso on: account2.
	
	transactions := portfolio transactions.
	
	self assert: ( transactions includes: deposit1).
	self assert: ( transactions includes: deposit2).
	self assert: ( transactions includes: withdraw1).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:39:20'!
test08PortfolioWithAccountAndAnotherPortfolioHasExpectedBalance

	|portfolio1 portfolio2 account1 account2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio1 addAccount: account1.
	portfolio2 addAccount: account2.
	portfolio1 addAccount: portfolio2.
	
	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	
	self assert: (100 * peso) equals: ( portfolio1 balance).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:40:34'!
test09PortfolioWithAccountAndAnotherPortfolioKnowsOperatons

	|portfolio1 portfolio2 account1 account2 deposit1 deposit2 withdraw1|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio1 addAccount: account1.
	portfolio2 addAccount: account2.
	portfolio1 addAccount: portfolio2.
	
	deposit1 := Deposit register: 100 * peso on: account1.
	withdraw1 := Withdraw register: 50 * peso on: account1.
	deposit2 := Deposit register: 50 * peso on: account2.
	
	self assert: (portfolio1 hasRegistered: deposit2).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:41:20'!
test10PortfolioWithAccountAndAnotherPortfolioKnowsAllTransactions

	|portfolio1 portfolio2 account1 account2 deposit1 deposit2 withdraw1|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio1 addAccount: account1.
	portfolio2 addAccount: account2.
	portfolio1 addAccount: portfolio2.
	
	deposit1 := Deposit register: 100 * peso on: account1.
	withdraw1 := Withdraw register: 50 * peso on: account1.
	deposit2 := Deposit register: 50 * peso on: account2.
	
	self assert: (portfolio1 transactions includes: deposit1).
	self assert: (portfolio1 transactions includes: withdraw1).
	self assert: (portfolio1 transactions includes: deposit2).! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:45:10'!
test11CannotAddAReceptiveAccountToAPortfolioThatHasAnotherPorfolioWithThatAccountAlreadyIncluded

	|portfolioA portfolioB accountB|
	
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.

	accountB := ReceptiveAccount new.
	
	portfolioB addAccount: accountB.
	portfolioA addAccount: portfolioB.


	self should: [portfolioA addAccount: accountB.] raise: Error withExceptionDo: [:anError | Portfolio cannotAddAnAlreadyAddedAccountErrorDescription = anError messageText].
	! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:44:29'!
test12APortfolioCannotBeAddedToItSelf

	|portfolioA |
	
	portfolioA := Portfolio new.

	self should: [portfolioA addAccount: portfolioA] raise: Error withExceptionDo: [:anError | Portfolio cannotAddAnAlreadyAddedAccountErrorDescription = anError messageText].
	! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:47:13'!
test13CannotAddAnAccountToAPortfolioThatHisFatherPortfolioAlreadyHasThatAccount

	|portfolioA portfolioB accountA|
	
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	
	accountA := ReceptiveAccount new.
	
	portfolioA addAccount: accountA.
	portfolioA addAccount: portfolioB.
	
	self should: [portfolioB addAccount: accountA] raise: Error withExceptionDo: [:anError | Portfolio cannotAddAnAlreadyAddedAccountErrorDescription = anError messageText].
	

! !

!PortfolioTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:51:14'!
test14CannotAddAPortfolioThatHasAnAccountToAnotherPorfolioThatIsSonOfAPorfolioThatAlreadyHasThatAccount

	|portfolioA portfolioB portfolioC accountA|
	
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	portfolioC := Portfolio new.

	accountA := ReceptiveAccount new.
	
	portfolioA addAccount: accountA.
	portfolioA addAccount: portfolioB.
	portfolioC addAccount: accountA.
	
	
	self should: [portfolioB addAccount: portfolioC] raise: Error withExceptionDo: [:anError | Portfolio cannotAddAnAlreadyAddedAccountErrorDescription = anError messageText].
	

	"Te dejo el dibujito :)

	A----->a
	!!
	!!
	B  
	. Intento agregar porfolio C a B
	.
	C---->a
	"! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferLegTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferLegTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLegTest methodsFor: 'test' stamp: 'MNC 11/11/2022 15:05:55'!
test01

	|destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	transfer := Transfer newFrom: destinationAccount to: originAccount forAValue: (100 * peso).
	
	
	self assert: (transfer withdrawLeg counterpart = originAccount transactions first).! !

!TransferLegTest methodsFor: 'test' stamp: 'MNC 11/11/2022 15:09:04'!
test02

	|destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	transfer := Transfer newFrom: destinationAccount to: originAccount forAValue: (100 * peso).
	
	self assert: ((transfer depositLeg) counterpart = destinationAccount transactions first).! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:56:32'!
test01ATransaferDoAWithdrawInTheOriginAccountAndADepositInTheDestinationAccount

	|destinationAccount originAccount|
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	Transfer newFrom: originAccount to: destinationAccount forAValue: (100 * peso).
	
	self assert: (destinationAccount balance isEqualTo: (100 * peso)).
	self assert: (originAccount balance isEqualTo: (-100 * peso)).! !

!TransferTest methodsFor: 'test' stamp: 'MNC 11/11/2022 14:56:59'!
test02ATransaferKnowsItValue

	|destinationAccount originAccount transfer|
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	transfer := Transfer newFrom: originAccount to: destinationAccount forAValue: (100 * peso).
	
	self assert: (transfer value = (100 * peso))! !

!TransferTest methodsFor: 'test' stamp: 'MNC 11/10/2022 01:19:03'!
test03

	|destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	transfer := Transfer newFrom: destinationAccount to: originAccount forAValue: (100 * peso).
	
	
	self assert: (transfer withdrawLeg counterpart = originAccount transactions first).! !

!TransferTest methodsFor: 'test' stamp: 'MNC 11/10/2022 01:18:36'!
test04

	|destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	transfer := Transfer newFrom: destinationAccount to: originAccount forAValue: (100 * peso).
	
	self assert: ((transfer depositLeg) counterpart = destinationAccount transactions first).! !

!TransferTest methodsFor: 'test' stamp: 'MNC 11/11/2022 15:12:18'!
test05IsNotPossibleToTransferZeroOrLessMoney

	|originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	self should: [Transfer newFrom: originAccount to: destinationAccount forAValue: (0 * peso)] raise: Error withExceptionDo: [:anError | Transfer transferValueMustBeGreaterThanZeroErrorDescription = anError messageText].
	
	! !

!TransferTest methodsFor: 'test' stamp: 'MNC 11/11/2022 15:12:31'!
test06IsNotPossibleToTransferToTheSameAccount

	|anAccount|
	
	anAccount := ReceptiveAccount new.
	
	self should: [Transfer newFrom: anAccount to: anAccount forAValue: (100 * peso)] raise: Error withExceptionDo: [:anError | Transfer cannotTransferToItSelfErrorDescription = anError messageText].
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:10:48'!
asSonOf: anAccount

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:11:24'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:12:49'!
hasRegistered: aTransaction 

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:14:31'!
hasThisAccount: anAccount

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:14:46'!
includedAccounts

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:15:06'!
transactions 

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'allAccounts fatherPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'operations' stamp: 'MNC 11/11/2022 13:59:34'!
addAccount: anAccount 
	
	self assertThanPortfolioToBeAddedIsNotItSelf: anAccount.
	self assertThanAccountIsNotAlreadyAddedInPortfolioNet: anAccount.
	
	allAccounts add: anAccount.
	
	anAccount asSonOf: self
	
	
	
	! !


!Portfolio methodsFor: 'private' stamp: 'MNC 11/11/2022 14:04:39'!
assertThanAccountIsNotAlreadyAddedInPortfolioNet: anAccount.
	
	((anAccount includedAccounts) anySatisfy: [:anElement | self isAccountAlreadyAddedInNet: anElement ]) ifTrue: [self errorCannotAddAnAlreadyAddedAccount].
		! !

!Portfolio methodsFor: 'private' stamp: 'MNC 11/11/2022 13:58:46'!
assertThanPortfolioToBeAddedIsNotItSelf: anAccount.
	
	(self = anAccount) ifTrue: [self errorAPortfolioCannotBeAddedToItSelf]! !

!Portfolio methodsFor: 'private' stamp: 'MNC 11/10/2022 11:13:21'!
errorAPortfolioCannotBeAddedToItSelf

	^ self error: self class aPortfolioCannotBeAddedToItSelfErrorDescription! !

!Portfolio methodsFor: 'private' stamp: 'MNC 11/10/2022 10:51:10'!
errorCannotAddAnAlreadyAddedAccount

	^ self error: self class cannotAddAnAlreadyAddedAccountErrorDescription! !


!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 13:55:55'!
asSonOf: anAccount

	fatherPortfolios add: anAccount! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 13:59:34'!
balance
	
	^allAccounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:00:02'!
hasRegistered: aSpecificTransaction 
	
	^self transactions anySatisfy: [:aTransaction | aTransaction = aSpecificTransaction]! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:00:41'!
hasThisAccount: anSpecificAccount

	^allAccounts anySatisfy: [:anAccount |  anAccount hasThisAccount: anSpecificAccount ]! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:04:39'!
includedAccounts

	^allAccounts copy! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:03:20'!
isAccountAlreadyAddedInNet: anAccount

	fatherPortfolios ifEmpty: [^self hasThisAccount: anAccount].
	^(fatherPortfolios anySatisfy: [:aFatherPortfolio | aFatherPortfolio isAccountAlreadyAddedInNet: anAccount])! !

!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/11/2022 13:59:34'!
transactions
	|transactions|
	transactions := OrderedCollection new.
	
	allAccounts do: [:anAccount | transactions addAll: (anAccount transactions)].
	
	^transactions
	! !


!Portfolio methodsFor: 'initialization' stamp: 'MNC 11/11/2022 13:59:34'!
initialize
	
	allAccounts := OrderedCollection new.
	fatherPortfolios := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MNC 11/10/2022 11:14:05'!
aPortfolioCannotBeAddedToItSelfErrorDescription

	^' A portfolio cannot be added to It self'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MNC 11/10/2022 10:49:46'!
cannotAddAnAlreadyAddedAccountErrorDescription

	^'Cannot add an already added account'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MNC 11/8/2022 00:33:36'!
balance

	^transactions sum: [ :aTransaction | aTransaction addToABalance: 0 ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:03:45'!
asSonOf: anAccount

! !

!ReceptiveAccount methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:05:06'!
hasThisAccount: anAccount

	^self = 	anAccount ! !

!ReceptiveAccount methodsFor: 'accesing' stamp: 'MNC 11/11/2022 14:04:39'!
includedAccounts

	^OrderedCollection with: self! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'operation' stamp: 'MNC 11/8/2022 00:26:16'!
addToABalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'operation' stamp: 'MNC 11/8/2022 00:26:40'!
addToABalance: aBalance

	^aBalance  + self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'operation' stamp: 'MNC 11/8/2022 00:26:49'!
addToABalance: aBalance

	^aBalance  - self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'MNC 11/10/2022 01:16:36'!
initializeWithADeposit: aDeposit aWithdraw: aWithdraw aValue: aValue.
	
	depositLeg := TransferLeg with: aDeposit counterpart: aWithdraw.
	withdrawLeg := TransferLeg with: aWithdraw counterpart: aDeposit.
	value := aValue.! !


!Transfer methodsFor: 'accesing' stamp: 'MNC 11/8/2022 20:29:02'!
depositLeg
	^depositLeg ! !

!Transfer methodsFor: 'accesing' stamp: 'MNC 11/8/2022 00:57:50'!
value 

	^value! !

!Transfer methodsFor: 'accesing' stamp: 'MNC 11/8/2022 20:29:10'!
withdrawLeg
	^withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'MNC 11/10/2022 01:09:01'!
newFrom: anOriginAccount to: aDestinationAccount forAValue: aValue  
	|aDeposit aWithdraw|
	self assertValidValue: aValue.
	self assertOriginAccount: anOriginAccount isDiferentThanDestinationAccount: aDestinationAccount.
	
	aDeposit := Deposit register: aValue on: 	aDestinationAccount.
	aWithdraw := Withdraw register: aValue on: anOriginAccount.
	^self new initializeWithADeposit: aDeposit aWithdraw: aWithdraw aValue: aValue.! !


!Transfer class methodsFor: 'as yet unclassified' stamp: 'MNC 11/10/2022 01:10:22'!
assertOriginAccount: anOriginAccount isDiferentThanDestinationAccount: aDestinationAccount.

	(anOriginAccount = aDestinationAccount) ifTrue: [self error: self cannotTransferToItSelfErrorDescription] ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MNC 11/8/2022 02:12:33'!
assertValidValue: aValue

	aValue > 0 ifFalse: [self error: self transferValueMustBeGreaterThanZeroErrorDescription ]! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MNC 11/10/2022 01:12:19'!
cannotTransferToItSelfErrorDescription

	^'Origin account and destination account cannot be the same to transfer'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'MNC 11/8/2022 02:05:19'!
transferValueMustBeGreaterThanZeroErrorDescription

	^'Transfer value must be greater than 0'! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: 'transaction counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'MNC 11/10/2022 01:15:38'!
initializeWith: aTransaction counterpart: aWithdraw

	transaction := aTransaction.
	counterpart := aWithdraw! !


!TransferLeg methodsFor: 'accesing' stamp: 'MNC 11/10/2022 01:15:11'!
counterpart

	^counterpart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'MNC 11/10/2022 01:16:19'!
with: aTransaction counterpart: aCounterpart

	^self new initializeWith: aTransaction counterpart: aCounterpart! !
