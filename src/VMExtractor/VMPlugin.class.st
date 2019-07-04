Class {
	#name : #VMPlugin,
	#superclass : #Object,
	#instVars : [
		'name',
		'platform',
		'target'
	],
	#category : #VMExtractor
}

{ #category : #'instance creation' }
VMPlugin class >> named: aName [
	
	^ self new
		name: aName;
		yourself
]

{ #category : #accessing }
VMPlugin >> commonHeaders [
	
	^ self filterHeaders: self commonPluginDirectory children.
]

{ #category : #accessing }
VMPlugin >> commonPluginDirectory [
	
	^ platform vmPath / 'platforms' / 'Cross' / 'plugins' / name
]

{ #category : #accessing }
VMPlugin >> commonSources [
	
	^ self filterSources: self commonPluginDirectory children.
]

{ #category : #operations }
VMPlugin >> extractForPlatform: aPlatform into: aTarget [
	
	platform := aPlatform.
	target := aTarget / name.
	
	target ensureCreateDirectory.
	
	self headers do: [ :e | e copyTo: target / e basename ].
	self sources do: [ :e | e copyTo: target / e basename ].

]

{ #category : #filtering }
VMPlugin >> filterHeaders: aCollection [ 
	
	^ aCollection select: [ :e | e basename endsWith: '.h' ].
]

{ #category : #filtering }
VMPlugin >> filterSources: aCollection [

	^ aCollection select: [ :e | e basename endsWith: '.c' ]
]

{ #category : #accessing }
VMPlugin >> headers [
	
	^ self commonHeaders , self platformHeaders 
]

{ #category : #accessing }
VMPlugin >> name: aString [ 
	
	name := aString
]

{ #category : #accessing }
VMPlugin >> platformHeaders [
	
	^ self filterHeaders: self platformPluginDirectory children.
]

{ #category : #accessing }
VMPlugin >> platformPluginDirectory [
	
	^ platform platformPluginDirectory / name
]

{ #category : #accessing }
VMPlugin >> platformSources [
	
	^ self filterSources: self platformPluginDirectory children.
]

{ #category : #accessing }
VMPlugin >> pluginDirectory [
	
	^ platform pluginDirectory / name
]

{ #category : #accessing }
VMPlugin >> pluginSources [
	
	^ self filterSources: self pluginDirectory children.
]

{ #category : #accessing }
VMPlugin >> sources [

	^ self commonSources , self platformSources , self pluginSources
]
