Class {
	#name : #VmeOSX64Platform,
	#superclass : #Vme64BitsPlatform,
	#category : #VMExtractor
}

{ #category : #'instance creation' }
VmeOSX64Platform class >> on: aPath [

	^ self new 
		vmPath: aPath asFileReference;
		yourself
]

{ #category : #accessing }
VmeOSX64Platform >> platformPluginDirectory [
	
	^ vmPath / 'platforms' / 'iOS' / 'plugins'
]

{ #category : #accessing }
VmeOSX64Platform >> platformSources [
	^ #('aio.c' 'sqUnixCharConv.c') collect: [ :e | self platformSourcesDirectory / e ]
]

{ #category : #accessing }
VmeOSX64Platform >> platformSourcesDirectory [
	^ vmPath / 'platforms' / 'unix' / 'vm'
]

{ #category : #accessing }
VmeOSX64Platform >> vmHeaders [

	^ (#('sq.h' 'sqMemoryAccess.h' 'sqVirtualMachine.h' 'sqCogStackAlignment.h' 'dispdbg.h' 'sqAssert.h' 'sqMemoryFence.h' 'sqAtomicOps.h') collect: [ :e  | self vmCommonSourceDirectory / e ]) ,  
	(#('sqConfig.h' 'sqPlatformSpecific.h') collect: [ :e  | self vmSourceDirectory / e ]), 
	(#('sqGnu.h') collect: [ :e  | vmPath / 'platforms' / 'iOS' / 'vm' / 'Common' / e ]),
	(#('debug.h' 'sqaio.h' 'sqUnixCharConv.h') collect: [ :e  | vmPath / 'platforms' / 'unix' / 'vm' / e ])

]

{ #category : #'as yet unclassified' }
VmeOSX64Platform >> vmSourceDirectory [

	^ vmPath / 'platforms' / 'iOS' / 'vm' / 'OSX'
]
