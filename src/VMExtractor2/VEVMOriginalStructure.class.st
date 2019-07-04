Class {
	#name : #VEVMOriginalStructure,
	#superclass : #VEAbstractOriginalStructure,
	#category : #VMExtractor2
}

{ #category : #directories }
VEVMOriginalStructure >> commonDirectories [
	
	^ { repo / 'spur64src/vm' . repo / 'platforms/Cross/vm' }
]

{ #category : #directories }
VEVMOriginalStructure >> osxDirectories [
	
	^ { repo / 'platforms/iOS/vm/OSX'. repo / 'platforms/iOS/vm/Common' }
]

{ #category : #directories }
VEVMOriginalStructure >> unixDirectories [
	
	^ { repo / 'platforms/unix/vm' }
]

{ #category : #directories }
VEVMOriginalStructure >> winDirectories [
	
	^ { repo / 'platforms/win32/vm' }
]
