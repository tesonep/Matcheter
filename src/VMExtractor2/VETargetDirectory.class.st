Class {
	#name : #VETargetDirectory,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VETargetDirectory class >> on: aFileReference [

	^ self new
		fileReference: aFileReference;
		yourself 
]

{ #category : #operations }
VETargetDirectory >> ensureCreateDirectory [
	
	fileReference ensureCreateDirectory
]

{ #category : #accessing }
VETargetDirectory >> fileReference [
	^ fileReference
]

{ #category : #accessing }
VETargetDirectory >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #printing }
VETargetDirectory >> printOn: aStream [

	aStream
		<< self class name;
		<< '(';
		<< fileReference fullName asString;
		<< ')'
]
