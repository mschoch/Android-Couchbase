# New Android-Couchbase Instructions

NOTE: Do not use the source in this repository, only the binary Downloads and instructions

## Prerequisites

- Android SDK
- Eclipse ADT

## Instructions

1.  Create a new Android project or select an existing project

2.  Download Couchbase.zip and couchbase.xml into the top-level of the project:
  - https://github.com/downloads/mschoch/Android-Couchbase/Couchbase.zip
  - https://github.com/downloads/mschoch/Android-Couchbase/couchbase.xml

3.  Right-click on couchbase.xml and select Run As > Ant Build

4.  Refresh your project

## Starting Couchbase

Now that your project supports Couchbase, starting Cocuhbase is accomplished by adding a few things to your application's Main Activity.

1.  Create an instance of ICouchbaseDelegate, you can implement these methods to respond to Couchbase events
<pre>    
    private final ICouchbaseDelegate mCallback = new ICouchbaseDelegate.Stub() {
        @Override
        public void couchbaseStarted(String host, int port) {}
    
        @Override
        public void installing(int completed, int total) {}
    
        @Override
        public void exit(String error) {}
    };
</pre>

2.  Declare a ServiceConnection instance to keep a reference to the Couchbase service
<pre>
    private ServiceConnection couchServiceConnection;
</pre>

3.  Add a method to start Couchbase
<pre>
	public void startCouchbase() {
		CouchbaseMobile couch = new CouchbaseMobile(getBaseContext(), mCallback);
		couchServiceConnection = couch.startCouchbase();
	}
</pre>

4.  Call the startCouchbase method from the appropriate Activity lifecycle methods.  For many applications the onCreate method is appropriate
<pre>    
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    
        ...
    
        startCouchbase();
    }
</pre>    

## Help and More Information

For help or more information please join the Couchbase Mobile Google Group:

https://groups.google.com/group/mobile-couchbase
