Class {
	#name : #VEAbstractOriginalStructure,
	#superclass : #Object,
	#instVars : [
		'repo'
	],
	#category : #VMExtractor2
}

{ #category : #resolving }
VEAbstractOriginalStructure >> commonDirectories [

	^ self subclassResponsibility
]

{ #category : #resolving }
VEAbstractOriginalStructure >> osxDirectories [

	^ self subclassResponsibility
]

{ #category : #accessing }
VEAbstractOriginalStructure >> repo [
	^ repo
]

{ #category : #accessing }
VEAbstractOriginalStructure >> repo: anObject [
	repo := anObject
]

{ #category : #resolving }
VEAbstractOriginalStructure >> resolve: aBaseName in: directories type: aType platform: aPlatform [
	
	^ directories
		detect: [ :e | (e / aBaseName) exists ]
		ifFound: [ :fileReference | {VEOriginalFile on: fileReference / aBaseName type: aType platform: aPlatform} ]
		ifNone: [ #() ]
]

{ #category : #resolving }
VEAbstractOriginalStructure >> resolveAll: aBaseName type: aType [

	^ (self resolve: aBaseName in: self commonDirectories type: aType platform: #common) ,
	  (self resolve: aBaseName in: self unixDirectories type: aType platform: #unix),
	  (self resolve: aBaseName in: self osxDirectories type: aType platform: #osx),
	  (self resolve: aBaseName in: self winDirectories type: aType platform: #win)
]

{ #category : #resolving }
VEAbstractOriginalStructure >> unixDirectories [

	^ self subclassResponsibility
]

{ #category : #resolving }
VEAbstractOriginalStructure >> winDirectories [

	^ self subclassResponsibility
]
