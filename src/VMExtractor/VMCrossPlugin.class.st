Class {
	#name : #VMCrossPlugin,
	#superclass : #VMPlugin,
	#category : #VMExtractor
}

{ #category : #accessing }
VMCrossPlugin >> headers [

	^ self commonHeaders
]

{ #category : #accessing }
VMCrossPlugin >> sources [

	^ self commonSources
]
