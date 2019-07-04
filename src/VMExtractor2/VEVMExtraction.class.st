Class {
	#name : #VEVMExtraction,
	#superclass : #Object,
	#instVars : [
		'vmTarget',
		'repository',
		'outputDirectory',
		'plugins',
		'originalStructure'
	],
	#category : #VMExtractor2
}

{ #category : #running }
VEVMExtraction class >> run [ 
	self new
		outputDirectory: '/Users/admin/dev/Pharo/git-repos/extractedVM/extracted' asFileReference;
		repository: '/Users/admin/dev/Pharo/git-repos/opensmalltalk-vm' asFileReference; 
		addPluginNames: #('FilePlugin' 'FileAttributesPlugin' 'SocketPlugin'
		'IA32ABI' 'SqueakFFIPrims' 'SurfacePlugin' 'LargeIntegers' 'MiscPrimitivePlugin'
		'LocalePlugin' 'BitBltPlugin' 'B2DPlugin' 'MD5Plugin' 'SqueakSSL');
		fileExtractions;
		clean;
		extract
]

{ #category : #plugins }
VEVMExtraction >> addPluginNames: aCollection [ 
	
	plugins addAll: (aCollection collect: [:aName | VEPluginExtraction name: aName output: outputDirectory source: repository ])
]

{ #category : #operations }
VEVMExtraction >> clean [
	vmTarget clean.
	plugins do: [ :e | e target clean ].
	
	
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> extract [

	vmTarget ensureCreate.
	plugins do: [ :e | e target ensureCreate ].
	
	^ self fileExtractions do: #extract
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> fileExtractions [

	^ (self resolveFiles collect: [ :e | e generateExtractionTo: vmTarget ]) , 
		(plugins flatCollect: [ :e | e fileExtractions ])
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> headersToLookup [

	^ #('cogit.h' 'cogmethod.h' 'cointerp.h' 'dispdbg.h' 'interp.h' 'sq.h' 'sqaio.h' 'sqAssert.h' 'sqAtomicOps.h' 'sqCogStackAlignment.h' 'sqConfig.h' 'sqGnu.h' 'sqMemoryAccess.h' 'sqMemoryFence.h' 'sqPlatformSpecific.h' 'sqUnixCharConv.h' 'sqVirtualMachine.h' 'vmCallback.h' 'sqWin32Alloc.h' 'sqWin32.h' 'sqWin32HandleTable.h')
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> initialize [ 
	
	super initialize.
	plugins := OrderedCollection new
]

{ #category : #accessing }
VEVMExtraction >> outputDirectory: aFileReference [ 
	
	outputDirectory := aFileReference.
	vmTarget := VETargetStructure on: aFileReference / 'vm'
]

{ #category : #accessing }
VEVMExtraction >> platform [
	^ originalStructure
]

{ #category : #accessing }
VEVMExtraction >> platform: anObject [
	originalStructure := anObject
]

{ #category : #accessing }
VEVMExtraction >> repository: aFileReference [ 
	
	repository := aFileReference.
	originalStructure := VEVMOriginalStructure new repo: aFileReference
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> resolveAllFiles: baseName type: type [

	| resolved |
	resolved := originalStructure resolveAll: baseName type: type.
	resolved ifEmpty: [ self error: 'Could not resolve ' , baseName  ].
	
	^ resolved
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> resolveFiles [

	^ (self sourcesToLookup flatCollect: [ :e | self resolveAllFiles: e type: #src ]) ,
	  (self headersToLookup flatCollect: [ :e | self resolveAllFiles: e type: #include ])
]

{ #category : #'as yet unclassified' }
VEVMExtraction >> sourcesToLookup [

	^ #('aio.c' 'cogit.c' 'cogitX64SysV.c' 'cogitX64WIN64.c' 'gcc3x-cointerp.c' 'sqExternalSemaphores.c' 'sqHeapMap.c' 'sqNamedPrims.c' 'sqUnixCharConv.c' 'sqVirtualMachine.c' 'sqWin32SpurAlloc.c' 'sqWin32Directory.c' 'sqUnixHeartbeat.c' 'sqWin32Heartbeat.c')
]
