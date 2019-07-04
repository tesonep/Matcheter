Extension { #name : #Collection }

{ #category : #'*VMExtractor2' }
Collection >> cartesianProduct: anotherCollection [ 
	
	^ self flatCollect: [ :a | 
		anotherCollection collect: [ :b | { a. b. } ]]
]
