Class {
	#name : #VEOriginalFile,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'type',
		'platform'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VEOriginalFile class >> on: aFileReference type: aType platform: aPlatform [
	
	^ self new
		fileReference: aFileReference;
		type: aType;
		platform: aPlatform;
		yourself
]

{ #category : #accessing }
VEOriginalFile >> fileReference [
	^ fileReference
]

{ #category : #accessing }
VEOriginalFile >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #extracting }
VEOriginalFile >> generateExtractionTo: targetStructure [ 
	
	^ VEFileExtraction from: self to: targetStructure
]

{ #category : #accessing }
VEOriginalFile >> platform [
	^ platform
]

{ #category : #accessing }
VEOriginalFile >> platform: anObject [
	platform := anObject
]

{ #category : #accessing }
VEOriginalFile >> printOn: aStream [

	aStream << self class name asString;
	<< '( ' ; << type asString ;
	<< ' '; << platform asString ; 
	<< ' '; << fileReference fullName asString ; << ')'
]

{ #category : #accessing }
VEOriginalFile >> type [
	^ type
]

{ #category : #accessing }
VEOriginalFile >> type: anObject [
	type := anObject
]
