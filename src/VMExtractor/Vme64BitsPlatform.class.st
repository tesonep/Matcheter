Class {
	#name : #Vme64BitsPlatform,
	#superclass : #Object,
	#instVars : [
		'vmPath'
	],
	#category : #VMExtractor
}

{ #category : #accessing }
Vme64BitsPlatform >> commonSources [

	^ #('sqHeapMap.c' 'sqVirtualMachine.c' 'sqNamedPrims.c' 'sqExternalSemaphores.c') collect: [ :e  | self vmCommonSourceDirectory / e ]
]

{ #category : #accessing }
Vme64BitsPlatform >> headers [

	^ self spurHeaders , self vmHeaders
]

{ #category : #accessing }
Vme64BitsPlatform >> pluginDirectory [
	^ vmPath / 'src' / 'plugins'
]

{ #category : #accessing }
Vme64BitsPlatform >> sources [

	^ self spurSources , self commonSources , self platformSources
]

{ #category : #accessing }
Vme64BitsPlatform >> spurHeaders [

	^ #('cogit.h' 'cogmethod.h' 'cointerp.h' 'vmCallback.h' 'interp.h') collect: [ :e  | self spurSourceDirectory / e ]
]

{ #category : #'as yet unclassified' }
Vme64BitsPlatform >> spurSourceDirectory [

	^ vmPath / 'spur64src' / 'vm'
]

{ #category : #accessing }
Vme64BitsPlatform >> spurSources [

	^ #('cogit.c' 'cogitX64SysV.c' 'gcc3x-cointerp.c') collect: [ :e  | self spurSourceDirectory / e ]
]

{ #category : #'as yet unclassified' }
Vme64BitsPlatform >> vmCommonSourceDirectory [

	^ vmPath / 'platforms' / 'Cross' / 'vm'
]

{ #category : #accessing }
Vme64BitsPlatform >> vmPath [
	^ vmPath
]

{ #category : #accessing }
Vme64BitsPlatform >> vmPath: aString [ 
	
	vmPath := aString asFileReference.
	self assert: vmPath exists
]
