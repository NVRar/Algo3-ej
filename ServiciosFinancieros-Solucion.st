!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:10:02'!
test01AccountWithoutMovementsInformsBalance

	| account accountSummary|
	
	account := ReceptiveAccount new.
	accountSummary := AccountSummary of: account.

	self assert: 'Balance = 0 * pesos' equals: (accountSummary summary at: 1)
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:10:59'!
test02AccountWithADepositInformsDepositAndBalance

	| account accountSummary|
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	accountSummary := AccountSummary of: account.

	self assert: 'Depósito por 100 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Balance = 100 * pesos' equals: (accountSummary summary at: 2).
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:11:46'!
test03AccountWithAWithdrawInformsDepositAndBalance

	| account accountSummary|
	
	account := ReceptiveAccount new.
	Withdraw register: 50 * peso on: account.
	
	accountSummary := AccountSummary of: account.

	self assert: 'Extracción por 50 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Balance = -50 * pesos' equals: (accountSummary summary at: 2).
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:12:46'!
test04AccountWithATransaferDepositInformsTransaferDepositAndBalance

	| accountSummary destinationAccount originAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount.

	accountSummary := AccountSummary of: originAccount .

	self assert: 'Salida por transferencia de 20 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Balance = -20 * pesos' equals: (accountSummary summary at: 2).
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:13:28'!
test05AccountWithATransaferWithdrawInformsTransaferWithdrawAndBalance

	| accountSummary destinationAccount originAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Transfer amount: 30 * peso from: originAccount to: destinationAccount.

	accountSummary := AccountSummary of: destinationAccount.

	self assert: 'Entrada por transferencia de 30 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Balance = 30 * pesos' equals: (accountSummary summary at: 2).
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:14:05'!
test06AccountInformsAllTheOperationsAndBalance

	| accountSummary anotherAccount account|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	Transfer amount: 20 * peso from: account to: anotherAccount.
	Transfer amount: 30 * peso from: anotherAccount to: account.

	accountSummary := AccountSummary of: account.
	
	self assert: 'Depósito por 100 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Extracción por 50 * pesos' equals: (accountSummary summary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (accountSummary summary at: 3).
	self assert: 'Entrada por transferencia de 30 * pesos' equals: (accountSummary summary at: 4).
	self assert: 'Balance = 60 * pesos' equals: (accountSummary summary at: 5).
	"Pasa de una, pero es un caso de testear varias cosas, es importante que este"! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:14:40'!
test07PorfolioWithAnAccountInformsAllTheOperationsAndBalance

	| accountSummary anotherAccount account portfolio|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	Transfer amount: 20 * peso from: account to: anotherAccount.
	Transfer amount: 30 * peso from: anotherAccount to: account.

	accountSummary := AccountSummary of: portfolio.
	
	self assert: 'Depósito por 100 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Extracción por 50 * pesos' equals: (accountSummary summary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (accountSummary summary at: 3).
	self assert: 'Entrada por transferencia de 30 * pesos' equals: (accountSummary summary at: 4).
	self assert: 'Balance = 60 * pesos' equals: (accountSummary summary at: 5).
	"Pasa de una, No si a un porfolio es necesario pero probe, con una cuenta"! !

!AccountSummaryTest methodsFor: 'test' stamp: 'MNC 11/15/2022 12:15:17'!
test08PorfolioWithAccountsInformsAllTheOperationsAndBalance

	| accountSummary anotherAccount account portfolio|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio with: account with: anotherAccount.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	Transfer amount: 20 * peso from: account to: anotherAccount.
	Transfer amount: 30 * peso from: anotherAccount to: account.

	accountSummary := AccountSummary of: portfolio.
	
	self assert: 'Depósito por 100 * pesos' equals: (accountSummary summary at: 1).
	self assert: 'Extracción por 50 * pesos' equals: (accountSummary summary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (accountSummary summary at: 3).
	self assert: 'Entrada por transferencia de 30 * pesos' equals: (accountSummary summary at: 4).
	self assert: 'Entrada por transferencia de 20 * pesos' equals: (accountSummary summary at: 5).
	self assert: 'Salida por transferencia de 30 * pesos' equals: (accountSummary summary at: 6).
	self assert: 'Balance = 50 * pesos' equals: (accountSummary summary at: 7).
	"Pasa de una, No si a un porfolio es necesario pero probe, con dos cuentas"! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'MNC 11/18/2022 11:59:02'!
test11bPortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio named: 'Mi cuenta' with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'MNC 11/18/2022 17:20:44'!
test01EmptyPorfolio

	|familyPortfolio portfolioTreeReport |
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	portfolioTreeReport := PortfolioTreePrintedReport with: familyPortfolio.

	self assert: familyPortfolio name equals: (portfolioTreeReport report at: 1)
	! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'MNC 11/18/2022 17:20:56'!
test02PortfolioWithAnAccount

	|familyPortfolio portfolioTreeReport myAccount report|
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.

	portfolioTreeReport := PortfolioTreePrintedReport with: familyPortfolio.

	report := portfolioTreeReport report.

	self assert: 'Portfolio de la familia' equals: (report at: 1).
	self assert: '-Cuenta mia' equals: (report at: 2).
	! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'MNC 11/18/2022 17:21:29'!
test03PortfolioWithAnAccountAndAnotherPortfolio

	|familyPortfolio portfolioTreeReport childrenPortfolio myAccount report|
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	portfolioTreeReport := PortfolioTreePrintedReport with: familyPortfolio.

	report := portfolioTreeReport report.

	self assert: 'Portfolio de la familia' equals: (report at: 1).
	self assert: '-Cuenta mia' equals: (report at: 2).
	self assert: '-Portfolio de hijos' equals: (report at: 3).
	! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'MNC 11/18/2022 17:23:19'!
test04PorfolioWithAChildAccountAndAchildPortfolioAndTwoGrandchildrenAccounts

	|johnsAccount angiesAccount familyPortfolio portfolioTreeReport childrenPortfolio myAccount report|
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	portfolioTreeReport := PortfolioTreePrintedReport with: familyPortfolio.

	report := portfolioTreeReport report.

	self assert: 'Portfolio de la familia' equals: (report at: 1).
	self assert: '-Cuenta mia' equals: (report at: 2).
	self assert: '-Portfolio de hijos' equals: (report at: 3).
	self assert: '--Cuenta de Juan' equals: (report at: 4).
	self assert: '--Cuenta de Angeles' equals: (report at: 5).
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MNC 11/15/2022 13:14:33'!
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


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 13:32:48'!
test01

	|account1 transferNet |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	transferNet  := TransaferNet of: account1.
	
	self assert:  0 * peso equals: (transferNet net)! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 13:33:14'!
test02

	|transferNet account2 account1 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Transfer amount: 20 * peso from: account1 to: account2.
	
	transferNet  := TransaferNet of: account1.
	
	self assert:  -20 * peso equals: (transferNet net)
	
	"pasa de una"! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 13:23:34'!
test03

	|transferNet account2 account1 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.

	Transfer amount: 20 * peso from: account2 to: account1.
	
	transferNet  := TransaferNet of: account1.
	
	self assert: 20 * peso equals: (transferNet net)
	
	"pasa de una"! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 13:24:38'!
test04

	|transferNet account2 account1 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.

	Transfer amount: 50 * peso from: account1 to: account2.
	Transfer amount: 10 * peso from: account2 to: account1.
	
	transferNet  := TransaferNet of: account1.
	
	self assert: -40 * peso equals: (transferNet net)
	
	"pasa de una"! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 13:26:44'!
test05

	| anotherAccount account transferNet|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	Transfer amount: 20 * peso from: account to: anotherAccount.
	Transfer amount: 30 * peso from: anotherAccount to: account.

	
	transferNet  := TransaferNet of: account.
	
	self assert: 10 * peso equals: (transferNet net)
	
	"pasa de una"! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'MNC 11/18/2022 11:38:43'!
initializeNamed: aString 
	
	accountName := aString! !


!Account methodsFor: 'accesing' stamp: 'MNC 11/18/2022 11:40:07'!
name

	^accountName copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'MNC 11/18/2022 12:07:35'!
named: aString 
	
	^self new initializeNamed: aString ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents string account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'MNC 11/15/2022 11:04:42'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'accesing' stamp: 'MNC 11/18/2022 12:35:57'!
accounts

	^accounts copy! !


!Portfolio methodsFor: 'visitor' stamp: 'MNC 11/18/2022 16:20:21'!
accept: anReportVisitor

	^anReportVisitor visitPortfolio: self.! !

!Portfolio methodsFor: 'visitor' stamp: 'MNC 11/18/2022 17:19:16'!
iterateOverAccounts: aReport

	accounts do: [:anAccount | aReport report: anAccount copy]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 'MNC 11/18/2022 12:08:11'!
named: aString with: anAccount 
	
	^self new 
		add: anAccount;
		initializeNamed: aString;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'MNC 11/18/2022 12:42:58'!
named: aString with: anAccount with: anotherAccount
	
	^self new 
		add: anAccount;
		add: anotherAccount;
		initializeNamed: aString;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MNC 11/15/2022 11:04:50'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'visitor' stamp: 'MNC 11/18/2022 16:20:27'!
accept: anReportVisitor

	^anReportVisitor visitAReceptiveAccount: self.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'Initialization' stamp: 'MNC 11/15/2022 11:58:15'!
initializeOf: anAccount 
	
	account := anAccount.! !


!AccountSummary methodsFor: 'Operation' stamp: 'MNC 11/18/2022 17:19:16'!
summary

	|transactionsDetails accountTransactions|
	
	accountTransactions := account transactions.
	transactionsDetails := OrderedCollection new.
	
	accountTransactions do: [:anTransaction | transactionsDetails add: (anTransaction report: self) ].
	
	transactionsDetails add: ('Balance = ',account balance asString).
	
	^transactionsDetails ! !


!AccountSummary methodsFor: 'visitor' stamp: 'MNC 11/15/2022 21:18:45'!
reportOfDeposit: anAccountTransaction

	^'Depósito por ',anAccountTransaction value asString! !

!AccountSummary methodsFor: 'visitor' stamp: 'MNC 11/15/2022 21:19:20'!
reportOfTransferDeposit: anAccountTransaction

	^'Entrada por transferencia de ',anAccountTransaction value asString! !

!AccountSummary methodsFor: 'visitor' stamp: 'MNC 11/15/2022 21:19:42'!
reportOfTransferWithdraw: anAccountTransaction

	^'Salida por transferencia de ',anAccountTransaction value asString! !

!AccountSummary methodsFor: 'visitor' stamp: 'MNC 11/15/2022 21:20:00'!
reportOfWithdraw: anAccountTransaction

	^'Extracción por ',anAccountTransaction value asString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'MNC 11/15/2022 12:07:58'!
of: anAccount 
	
	^self new initializeOf: anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:19:16'!
report: aReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:19:16'!
report: aReport

	^aReport reportOfDeposit: self
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:19:16'!
report: aReport

	^aReport reportOfTransferDeposit: self
! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:19:16'!
report: aReport

	^aReport reportOfTransferWithdraw: self
! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:19:16'!
report: aReport

	^aReport reportOfWithdraw: self
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTreePrintedReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreePrintedReport
	instanceVariableNames: 'portfolio accountsName espacio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrintedReport methodsFor: 'initialization' stamp: 'MNC 11/18/2022 17:04:07'!
initializeWith: aPortfolio 

	portfolio := aPortfolio.
	accountsName := OrderedCollection new.
	espacio := '-'.! !


!PortfolioTreePrintedReport methodsFor: 'accesing' stamp: 'MNC 11/18/2022 17:06:21'!
report

	accountsName add: portfolio name.
	portfolio accounts do: [:anAccount | anAccount accept: self].
	
	^accountsName ! !


!PortfolioTreePrintedReport methodsFor: 'visitor' stamp: 'MNC 11/18/2022 17:03:34'!
visitAReceptiveAccount: aReceptiveAccount

	accountsName add: (espacio,aReceptiveAccount name)! !

!PortfolioTreePrintedReport methodsFor: 'visitor' stamp: 'MNC 11/18/2022 17:03:19'!
visitPortfolio: aPortfolio

	accountsName add: (espacio,aPortfolio name).
	espacio := espacio,'-'.
	aPortfolio accounts do: [:anAccount | anAccount accept: self]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrintedReport class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrintedReport class
	instanceVariableNames: ''!

!PortfolioTreePrintedReport class methodsFor: 'instance creation' stamp: 'MNC 11/18/2022 11:25:53'!
with: aPortfolio 
	
	^self new initializeWith: aPortfolio ! !


!classDefinition: #TransaferNet category: 'ServiciosFinancieros-Solucion'!
Object subclass: #TransaferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransaferNet methodsFor: 'Initialization' stamp: 'MNC 11/15/2022 12:58:30'!
initializeOf: anAccount 
	
	account := anAccount.! !


!TransaferNet methodsFor: 'Operation' stamp: 'MNC 11/18/2022 17:19:16'!
net
	
	^(account transactions) sum: [:aTransaction | aTransaction report: self ] ifEmpty: [0 * peso]
! !


!TransaferNet methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 21:38:52'!
reportOfDeposit: aDeposit

	^0*peso! !

!TransaferNet methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 21:35:58'!
reportOfTransferDeposit: aTransferDeposit

	^aTransferDeposit value! !

!TransaferNet methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 21:36:08'!
reportOfTransferWithdraw: aTransferWithdraw

	^aTransferWithdraw value negated! !

!TransaferNet methodsFor: 'as yet unclassified' stamp: 'MNC 11/15/2022 21:36:18'!
reportOfWithdraw: aWithdraw

	^0*peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransaferNet class' category: 'ServiciosFinancieros-Solucion'!
TransaferNet class
	instanceVariableNames: ''!

!TransaferNet class methodsFor: 'instance creation' stamp: 'MNC 11/15/2022 12:58:11'!
of: anAccount 
	
	^self new initializeOf: anAccount ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
