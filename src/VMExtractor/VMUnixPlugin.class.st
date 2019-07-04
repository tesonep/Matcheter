Class {
	#name : #VMUnixPlugin,
	#superclass : #VMPlugin,
	#category : #VMExtractor
}

{ #category : #accessing }
VMUnixPlugin >> platformPluginDirectory [
	
	^ platform vmPath / 'platforms' / 'unix' / 'plugins' / name
]
