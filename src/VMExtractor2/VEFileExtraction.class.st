Class {
	#name : #VEFileExtraction,
	#superclass : #Object,
	#instVars : [
		'originalFile',
		'targetDirectory'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VEFileExtraction class >> from: aOriginalFile to: aTargetDirectory [

	^ self new 
		originalFile: aOriginalFile;
		targetDirectory: aTargetDirectory;
		yourself
]

{ #category : #operations }
VEFileExtraction >> extract [

	originalFile fileReference
		copyTo:
			(targetDirectory
				targetReference: originalFile fileReference basename
				type: originalFile type
				platform: originalFile platform)
]

{ #category : #accessing }
VEFileExtraction >> originalFile [
	^ originalFile
]

{ #category : #accessing }
VEFileExtraction >> originalFile: anObject [
	originalFile := anObject
]

{ #category : #accessing }
VEFileExtraction >> printOn: aStream [

	aStream << self class name; 
	<< '('; print: originalFile;
	<< ' -> '; print: targetDirectory;
	<< ')'
]

{ #category : #accessing }
VEFileExtraction >> targetDirectory [
	^ targetDirectory
]

{ #category : #accessing }
VEFileExtraction >> targetDirectory: anObject [
	targetDirectory := anObject
]
