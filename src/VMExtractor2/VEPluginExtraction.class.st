Class {
	#name : #VEPluginExtraction,
	#superclass : #Object,
	#instVars : [
		'outputDirectory',
		'sourceDirectory',
		'name',
		'target',
		'originalStructure'
	],
	#category : #VMExtractor2
}

{ #category : #'instance creation' }
VEPluginExtraction class >> name: aName output: outputDirectory source: sourceDirectory [

	^ self basicNew 
		name: aName;
		outputDirectory: outputDirectory;
		sourceDirectory: sourceDirectory;
		initialize;
		yourself

	
]

{ #category : #accessing }
VEPluginExtraction >> fileExtractions [

	^ self resolveFiles collect: [ :e | e generateExtractionTo: target ]
]

{ #category : #accessing }
VEPluginExtraction >> headerFilenames [

	^ originalStructure allHeaderFilenames
]

{ #category : #accessing }
VEPluginExtraction >> initialize [

	super initialize.
	
	target := VETargetStructure on: outputDirectory / 'plugins' / name.
	originalStructure := VEPluginOriginalStructure on: sourceDirectory forPluginNamed: name.
]

{ #category : #accessing }
VEPluginExtraction >> name [
	^ name
]

{ #category : #accessing }
VEPluginExtraction >> name: anObject [
	name := anObject
]

{ #category : #accessing }
VEPluginExtraction >> outputDirectory [
	^ outputDirectory
]

{ #category : #accessing }
VEPluginExtraction >> outputDirectory: anObject [
	outputDirectory := anObject
]

{ #category : #accessing }
VEPluginExtraction >> resolveFiles [

	^ (self sourceFilenames flatCollect: [ :e | originalStructure resolveAll: e type: #src ]) ,
	  (self headerFilenames flatCollect: [ :e | originalStructure resolveAll: e type: #include ])
]

{ #category : #accessing }
VEPluginExtraction >> sourceDirectory [
	^ sourceDirectory
]

{ #category : #accessing }
VEPluginExtraction >> sourceDirectory: anObject [
	sourceDirectory := anObject
]

{ #category : #accessing }
VEPluginExtraction >> sourceFilenames [

	^ originalStructure allSourceFilenames
]

{ #category : #accessing }
VEPluginExtraction >> target [
	^ target
]

{ #category : #accessing }
VEPluginExtraction >> target: anObject [
	target := anObject
]
