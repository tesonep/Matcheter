Class {
	#name : #VEPluginOriginalStructure,
	#superclass : #VEAbstractOriginalStructure,
	#instVars : [
		'pluginName'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VEPluginOriginalStructure class >> on: originalDirectory forPluginNamed: aName [ 
	
	^ self basicNew
		repo: originalDirectory;
		pluginName: aName;
		initialize;
		yourself
]

{ #category : #listing }
VEPluginOriginalStructure >> allDirectories [
	
	^ self commonDirectories , self osxDirectories , self unixDirectories , self winDirectories
]

{ #category : #accessing }
VEPluginOriginalStructure >> allFilenamesWithExtensions: aCollection [ 

	^ (((self allDirectories flatCollect: [ :e | e exists ifTrue: [ e entries] ifFalse: [ #() ] ])
		collect: #asFileReference)
		select: [ :e | aCollection includes: e extension ]
		thenCollect: [ :e | e basename ]) asSet
]

{ #category : #accessing }
VEPluginOriginalStructure >> allHeaderFilenames [
	
	^ self allFilenamesWithExtensions: #('h')
]

{ #category : #listing }
VEPluginOriginalStructure >> allSourceFilenames [

	^ self allFilenamesWithExtensions: #('c' 'cpp').
]

{ #category : #resolving }
VEPluginOriginalStructure >> commonDirectories [

	^ {repo / 'platforms' / 'Cross' / 'plugins' / pluginName.
		repo / 'src' / 'plugins' / pluginName }
]

{ #category : #resolving }
VEPluginOriginalStructure >> osxDirectories [

	^ { repo / 'platforms' / 'iOS' / 'plugins' / pluginName }
]

{ #category : #accessing }
VEPluginOriginalStructure >> pluginName: aString [ 
	
	pluginName := aString
]

{ #category : #resolving }
VEPluginOriginalStructure >> unixDirectories [

	^ { repo / 'platforms' / 'unix' / 'plugins' / pluginName }
]

{ #category : #resolving }
VEPluginOriginalStructure >> winDirectories [

	^ { repo / 'platforms' / 'win32' / 'plugins' / pluginName }
]
