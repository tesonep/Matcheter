Class {
	#name : #VETargetStructure,
	#superclass : #Object,
	#instVars : [
		'directories',
		'root',
		'platforms',
		'types'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VETargetStructure class >> on: aRoot [

	^ self basicNew
		root: aRoot;
		initialize;
		yourself
]

{ #category : #operations }
VETargetStructure >> clean [

	root ensureDeleteAll
]

{ #category : #accessing }
VETargetStructure >> directories [
	^ directories
]

{ #category : #operations }
VETargetStructure >> ensureCreate [

	directories values do: #ensureCreateDirectory
]

{ #category : #accessing }
VETargetStructure >> initialize [ 
	
	| combinations targets |
	super initialize.
	
	platforms := #(common osx unix win).
	types := #(src include).
	
	combinations := types cartesianProduct: platforms.
	targets := combinations collect: [ :aCombination | aCombination -> (VETargetDirectory on: root / aCombination first / aCombination second) ].
	
	directories := targets asDictionary.
	
]

{ #category : #accessing }
VETargetStructure >> printOn: aStream [
	aStream
		<< self class name;
		<< '(';
		print: root;
		<< ')'
]

{ #category : #accessing }
VETargetStructure >> root [
	^ root
]

{ #category : #accessing }
VETargetStructure >> root: anObject [
	root := anObject
]

{ #category : #accessing }
VETargetStructure >> targetDirectoryOfType: aType forPlatform: aPlatform [

	^ directories at: { aType. aPlatform }
]

{ #category : #resolving }
VETargetStructure >> targetReference: aBasename type: aType platform: aPlatform [ 
	
	^ (self targetDirectoryOfType: aType forPlatform: aPlatform) fileReference / aBasename
]
