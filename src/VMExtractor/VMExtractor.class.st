Class {
	#name : #VMExtractor,
	#superclass : #Object,
	#instVars : [
		'platform',
		'target',
		'plugins'
	],
	#category : #VMExtractor
}

{ #category : #'as yet unclassified' }
VMExtractor class >> extractOSX64 [

	<script>

	VMExtractor new
		platform: (VmeOSX64Platform on: '/Users/admin/dev/Pharo/git-repos/opensmalltalk-vm');
		target: '/Users/admin/dev/Pharo/git-repos/extractedVM/extracted';
		addPlugin: (VMPlugin named: 'FilePlugin');
		addPlugin: (VMUnixPlugin named: 'FileAttributesPlugin');
		addPlugin: (VMPlugin named: 'UUIDPlugin');
		addPlugin: (VMUnixPlugin named: 'SocketPlugin');
		addPlugin: (VMPlugin named: 'IA32ABI');
		addPlugin: (VMPlugin named: 'SqueakFFIPrims');
		addPlugin: (VMCrossPlugin named: 'SurfacePlugin');
		addPlugin: (VMJustSourcePlugin named: 'LargeIntegers');
		addPlugin: (VMJustSourcePlugin named: 'MiscPrimitivePlugin');
		addPlugin: (VMPlugin named: 'LocalePlugin');
		addPlugin: (VMPlugin named: 'BitBltPlugin');
		addPlugin: (VMJustSourcePlugin named: 'B2DPlugin');
		clean;
		extract.
]

{ #category : #plugins }
VMExtractor >> addPlugin: aVMPlugin [ 
	
	plugins add: aVMPlugin
]

{ #category : #operations }
VMExtractor >> clean [
	
	self includesDirectory ensureDeleteAll.
	self sourceDirectory ensureDeleteAll.
	self pluginDirectory ensureDeleteAll.
]

{ #category : #executing }
VMExtractor >> extract [

	self includesDirectory ensureCreateDirectory.
	self sourceDirectory ensureCreateDirectory.
	
	platform headers
		do: [ :e | e copyTo: self includesDirectory / e basename ].
		
	platform sources
		do: [ :e | e copyTo: self sourceDirectory / e basename ].
		
	plugins do: [ :each | each extractForPlatform: platform into: self pluginDirectory ]
]

{ #category : #executing }
VMExtractor >> includesDirectory [

	^ target / 'includes'
]

{ #category : #accessing }
VMExtractor >> initialize [

	super initialize.
	plugins := OrderedCollection new.
]

{ #category : #accessing }
VMExtractor >> platform: anObject [ 
	
	platform := anObject
]

{ #category : #accessing }
VMExtractor >> pluginDirectory [
	
	^ target / 'plugins'
]

{ #category : #executing }
VMExtractor >> sourceDirectory [

	^ target / 'src'
]

{ #category : #accessing }
VMExtractor >> target: aString [ 
	
	target := aString asFileReference.
	target ensureCreateDirectory.
]
