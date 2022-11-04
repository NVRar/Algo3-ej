!classDefinition: #MarsRoverTests category: 'MarsRoverTDD'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 10:20:12'!
test01UnStringVacioNoEjecutaComandos
	
	self assert: (((MarsRover newEnPunto: 0@0 ConDireccion: Norte new) comandos: '') estaEnPunto: 0@0)! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:12:22'!
test02RecibeElComandofDireccionadoHaciaElNorteYAvanzaEnLaMismaDireccion

	|marsRover|
	marsRover := MarsRover newEnPunto: 5@5 ConDireccion: Norte new.
	marsRover comandos: 'f'.
	
	self assert: ( marsRover estaEnPunto: 5@6).
! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:06:35'!
test03RecibeElComandorDireccionadoHaciaElNorteYRotaHaciaLaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 3@3 ConDireccion: Norte new.
	marsRover comandos: 'r'.
	
	self assert: ( marsRover estaEnPunto: 3@3).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:06:43'!
test04RecibeElComandolDireccionadoHaciaElNorteYRotaHaciaLaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 3@3 ConDireccion: Norte new.
	marsRover comandos: 'l'.
	
	self assert: ( marsRover estaEnPunto: 3@3).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:06:50'!
test05RecibeElComandobDireccionadoHaciaElNorteYRetrocedeEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 8@3 ConDireccion: Norte new.
	marsRover comandos: 'b'.
	
	self assert: ( marsRover estaEnPunto: 8@2).
	self assert: (marsRover estaDireccionadoA: Norte ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:06:56'!
test06RecibeElComandofDireccionadoHaciaElEsteYAvanzaEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 8@3 ConDireccion: Este new.
	marsRover comandos: 'f'.
	
	self assert: ( marsRover estaEnPunto: 9@3).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:07:49'!
test07RecibeElComandobDireccionadoHaciaElEsteYRetrocedeEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 8@3 ConDireccion: Este new.
	marsRover comandos: 'b'.
	
	self assert: ( marsRover estaEnPunto: 7@3).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:07:41'!
test08RecibeElComandorDireccionadoHaciaElEsteYRotaHaciaLaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 8@3 ConDireccion: Este new.
	marsRover comandos: 'r'.
	
	self assert: ( marsRover estaEnPunto: 8@3).
	self assert: (marsRover estaDireccionadoA: Sur ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:07:57'!
test09RecibeElComandolDireccionadoHaciaElEsteYRotaHaciaLaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 8@3 ConDireccion: Este new.
	marsRover comandos: 'l'.
	
	self assert: ( marsRover estaEnPunto: 8@3).
	self assert: (marsRover estaDireccionadoA: Norte ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:04'!
test10RecibeElComandofDireccionadoHaciaElSurYAvanzaEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 13@3 ConDireccion: Sur new.
	marsRover comandos: 'f'.
	
	self assert: ( marsRover estaEnPunto: 13@2).
	self assert: (marsRover estaDireccionadoA: Sur ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:08'!
test11RecibeElComandobDireccionadoHaciaElSurYRetrocedeEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 13@3 ConDireccion: Sur new.
	marsRover comandos: 'b'.
	
	self assert: ( marsRover estaEnPunto: 13@4).
	self assert: (marsRover estaDireccionadoA: Sur ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:13'!
test12RecibeElComandorDireccionadoHaciaElSurYRotaHaciaLaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 13@3 ConDireccion: Sur new.
	marsRover comandos: 'r'.
	
	self assert: ( marsRover estaEnPunto: 13@3).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:17'!
test13RecibeElComandolDireccionadoHaciaElSurYRotaHaciaLaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 13@3 ConDireccion: Sur new.
	marsRover comandos: 'l'.
	
	self assert: ( marsRover estaEnPunto: 13@3).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:21'!
test14RecibeElComandofDireccionadoHaciaElOesteYAvanzaEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	marsRover comandos: 'f'.
	
	self assert: ( marsRover estaEnPunto: 9@5).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:25'!
test15RecibeElComandobDireccionadoHaciaElOesteYRetrocedeEnLaMismaDireccion
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	marsRover comandos: 'b'.
	
	self assert: ( marsRover estaEnPunto: 11@5).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:29'!
test16RecibeElComandorDireccionadoHaciaElOesteYRotaHaciaLaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	marsRover comandos: 'r'.
	
	self assert: ( marsRover estaEnPunto: 10@5).
	self assert: (marsRover estaDireccionadoA: Norte ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:33'!
test17RecibeElComandolDireccionadoHaciaElOesteYRotaHaciaLaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	marsRover comandos: 'l'.
	
	self assert: ( marsRover estaEnPunto: 10@5).
	self assert: (marsRover estaDireccionadoA: Sur ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:39'!
test18MirandoNorteAvanzaYRotaALaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.
	marsRover comandos: 'fr'.
	
	self assert: ( marsRover estaEnPunto: 10@6).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:43'!
test19MirandoNorteAvanzaYRotaALaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.
	marsRover comandos: 'fl'.
	
	self assert: ( marsRover estaEnPunto: 10@6).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:47'!
test20MirandoNorteRetrocedeYRotaALaDerecha
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.
	marsRover comandos: 'br'.
	
	self assert: ( marsRover estaEnPunto: 10@4).
	self assert: (marsRover estaDireccionadoA: Este ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:52'!
test21MirandoNorteRetrocedeYRotaALaIzquierda
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.
	marsRover comandos: 'bl'.
	
	self assert: ( marsRover estaEnPunto: 10@4).
	self assert: (marsRover estaDireccionadoA: Oeste ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:08:56'!
test22MirandoSurAvanzaDosVeces
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Sur new.
	marsRover comandos: 'ff'.
	
	self assert: ( marsRover estaEnPunto: 10@3).
	self assert: (marsRover estaDireccionadoA: Sur).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:00'!
test23MirandoSurRetrocedeDosVeces
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Sur new.
	marsRover comandos: 'bb'.
	
	self assert: ( marsRover estaEnPunto: 10@7).
	self assert: (marsRover estaDireccionadoA: Sur).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:03'!
test24MirandoSurRotaADerechaDosVeces
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Sur new.
	marsRover comandos: 'rr'.
	
	self assert: ( marsRover estaEnPunto: 10@5).
	self assert: (marsRover estaDireccionadoA: Norte).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:07'!
test25MirandoSurRotaAIzquierdaDosVeces
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Sur new.
	marsRover comandos: 'll'.
	
	self assert: ( marsRover estaEnPunto: 10@5).
	self assert: (marsRover estaDireccionadoA: Norte).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:11'!
test26MirandoNorteRealizaCuatroAcciones
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.
	marsRover comandos: 'frffflb'.
	
	self assert: ( marsRover estaEnPunto: 13@5).
	self assert: (marsRover estaDireccionadoA: Norte ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:17'!
test27MirandoOesteAvanzaRotaALaDerechaYVuelveAAvanzar
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	marsRover comandos: 'frf'.
	
	self assert: ( marsRover estaEnPunto: 9@6).
	self assert: (marsRover estaDireccionadoA: Norte ).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:22'!
test28UnComandoInvalidoAvisaConError
	|marsRover|
	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Oeste new.
	
	self should: [marsRover comandos: 'h'.] 
	raise: Error
	withExceptionDo: [:anError |self assert: MarsRover descripcionErrorCaracterInvalido equals: anError messageText ]
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'JP 11/4/2022 15:09:28'!
test29SerieDeComandosValidosSeguidoDeUnComandoInvalidoLevantaErrorYNoSeEjecutanLosComandosSiguientes
	|marsRover|

	marsRover := MarsRover newEnPunto: 10@5 ConDireccion: Norte new.

	self should: [marsRover comandos: 'frñff'.] 
	raise: Error
	withExceptionDo: [:anError | 
		self assert: ( marsRover estaEnPunto: 10@6). 
		self assert: (marsRover estaDireccionadoA: Este).
		self assert: MarsRover descripcionErrorCaracterInvalido equals: anError messageText.
		]
	! !


!classDefinition: #Comando category: 'MarsRoverTDD'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Comando methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:51:37'!
actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover

	self subclassResponsibility ! !

!Comando methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:51:54'!
actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover

	self subclassResponsibility ! !

!Comando methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:51:43'!
actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover

	self subclassResponsibility ! !

!Comando methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:51:49'!
actuaEstandoDireccionadoHaciaElSurEn: unMarsRover

	self subclassResponsibility ! !


!classDefinition: #MovimientoDeAvance category: 'MarsRoverTDD'!
Comando subclass: #MovimientoDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MovimientoDeAvance methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:22:05'!
actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover

	unMarsRover moverseAlEste.! !

!MovimientoDeAvance methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:22:55'!
actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover

	unMarsRover moverseAlNorte ! !

!MovimientoDeAvance methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:03'!
actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover

	unMarsRover moverseAlOeste! !

!MovimientoDeAvance methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:09'!
actuaEstandoDireccionadoHaciaElSurEn: unMarsRover

	unMarsRover moverseAlSur! !


!classDefinition: #MovimientoDeRetroceso category: 'MarsRoverTDD'!
Comando subclass: #MovimientoDeRetroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MovimientoDeRetroceso methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:24'!
actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover

	unMarsRover moverseAlOeste ! !

!MovimientoDeRetroceso methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:30'!
actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover

	unMarsRover moverseAlSur ! !

!MovimientoDeRetroceso methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:39'!
actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover

	unMarsRover moverseAlEste ! !

!MovimientoDeRetroceso methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:23:45'!
actuaEstandoDireccionadoHaciaElSurEn: unMarsRover

	unMarsRover moverseAlNorte ! !


!classDefinition: #RotacionADerecha category: 'MarsRoverTDD'!
Comando subclass: #RotacionADerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!RotacionADerecha methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:49:41'!
actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover

	unMarsRover rotarAlSur! !

!RotacionADerecha methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:49:32'!
actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover

	unMarsRover rotarAlEste ! !

!RotacionADerecha methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:48:20'!
actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover

	unMarsRover rotarAlNorte ! !

!RotacionADerecha methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:49:53'!
actuaEstandoDireccionadoHaciaElSurEn: unMarsRover

	unMarsRover rotarAlOeste ! !


!classDefinition: #RotacionAIzquierda category: 'MarsRoverTDD'!
Comando subclass: #RotacionAIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!RotacionAIzquierda methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:50:15'!
actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover

	unMarsRover rotarAlNorte! !

!RotacionAIzquierda methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:50:25'!
actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover

	unMarsRover rotarAlOeste! !

!RotacionAIzquierda methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:50:35'!
actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover

	unMarsRover rotarAlSur! !

!RotacionAIzquierda methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:50:45'!
actuaEstandoDireccionadoHaciaElSurEn: unMarsRover

	unMarsRover rotarAlEste! !


!classDefinition: #MarsRover category: 'MarsRoverTDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion avanzar retroceder rotarADerecha rotarAIzquierda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 12:22:04'!
moverseAlEste

	 posicion := posicion + (1@0)! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 12:22:15'!
moverseAlNorte

	 posicion := posicion + (0@1)! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 12:22:24'!
moverseAlOeste

	 posicion := posicion - (1@0)! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 12:22:32'!
moverseAlSur

	 posicion := posicion - (0@1)! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 10:37:04'!
rotarAlEste

	 direccion := Este new! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 10:37:07'!
rotarAlNorte

	 direccion := Norte new! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 10:37:10'!
rotarAlOeste

	 direccion := Oeste new! !

!MarsRover methodsFor: 'movimientos' stamp: 'JP 11/3/2022 10:37:13'!
rotarAlSur

	 direccion := Sur new! !


!MarsRover methodsFor: 'initialization' stamp: 'JP 11/4/2022 15:06:01'!
initializeEnPunto: unPunto conDireccion: unPuntoCardinal

	posicion := unPunto.
	direccion := unPuntoCardinal.
	
	avanzar := MovimientoDeAvance new.
	retroceder := MovimientoDeRetroceso new.
	rotarADerecha := RotacionADerecha new.
	rotarAIzquierda := RotacionAIzquierda new.! !


!MarsRover methodsFor: 'operaciones' stamp: 'JP 11/3/2022 12:09:46'!
comandos: unaSecuenciaDePotencialesComandos 
	
	(1 to: unaSecuenciaDePotencialesComandos size) do: [:unIndice |  | unCaracter | unCaracter := (unaSecuenciaDePotencialesComandos at: unIndice) asString. 
		(unCaracter = 'f') ifTrue: [direccion conEsteComando: avanzar en: self].
		(unCaracter = 'b') ifTrue: [direccion conEsteComando: retroceder en: self].
		(unCaracter = 'r') ifTrue: [direccion conEsteComando: rotarADerecha en: self].
		(unCaracter = 'l') ifTrue: [direccion conEsteComando: rotarAIzquierda en: self].
		((unCaracter isNotEqualTo: 'f') and: (unCaracter isNotEqualTo: 'b') and: (unCaracter isNotEqualTo: 'r') and: (unCaracter isNotEqualTo: 'l')) ifTrue: [self errorCaracterInvalido]
		].
	
! !


!MarsRover methodsFor: 'accesing' stamp: 'JP 11/3/2022 12:08:46'!
errorCaracterInvalido

	self error: self class descripcionErrorCaracterInvalido.! !

!MarsRover methodsFor: 'accesing' stamp: 'MNC 11/2/2022 21:59:22'!
estaDireccionadoA: unPuntoCardinal 
	^direccion isKindOf: unPuntoCardinal! !

!MarsRover methodsFor: 'accesing' stamp: 'MNC 11/2/2022 21:12:29'!
estaEnPunto: unPunto 
	^posicion = unPunto! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'JP 11/3/2022 12:08:04'!
descripcionErrorCaracterInvalido

	^'el caracter no representa ningun comando'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 21:46:40'!
newEnPunto: unPunto ConDireccion: unPuntoCardinal 
	^self new initializeEnPunto: unPunto conDireccion: unPuntoCardinal.! !


!classDefinition: #PuntoCardinal category: 'MarsRoverTDD'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:39:18'!
conEsteComando: unComando en: unMarsRover.

	self subclassResponsibility ! !


!classDefinition: #Este category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Este methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:46:12'!
conEsteComando: unComando en: unMarsRover.

	unComando actuaEstandoDireccionadoHaciaElEsteEn: unMarsRover.! !


!classDefinition: #Norte category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Norte methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:46:39'!
conEsteComando: unComando en: unMarsRover.

	unComando actuaEstandoDireccionadoHaciaElNorteEn: unMarsRover.! !


!classDefinition: #Oeste category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:46:49'!
conEsteComando: unComando en: unMarsRover.

	unComando actuaEstandoDireccionadoHaciaElOesteEn: unMarsRover.! !


!classDefinition: #Sur category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Sur methodsFor: 'as yet unclassified' stamp: 'MNC 11/2/2022 22:46:58'!
conEsteComando: unComando en: unMarsRover.

	unComando actuaEstandoDireccionadoHaciaElSurEn: unMarsRover.! !
